import {
    BaseConfig,
    ContextBuilder,
    Dpp,
    Plugin,
} from "https://deno.land/x/dpp_vim@v1.0.0/types.ts";
import { Denops, fn } from "https://deno.land/x/dpp_vim@v1.0.0/deps.ts";

const TomlFilesDir = "~/.config/nvim_vscode/dpp/toml";

//declare type [Toml] to contain the array of plugins.
type typeToml = {
    plugins?: Plugin[];
};

export class Config extends BaseConfig {
    override async config(args: {
        denops: Denops;
        contextBuilder: ContextBuilder;
        basePath: string;
        dpp: Dpp;
    }): Promise<{
        plugins: Plugin[];
        stateLines: string[];
        ftplugins: Record<string, string>;
        hooksFiles: string[];
    }> {
        args.contextBuilder.setGlobal({
            protocols: ["git"],
        });

        const [context, options] = await args.contextBuilder.get(args.denops);

        // specify toml files
        const tomlFiles = [
            "dpp.toml",
            "dpp_lazy.toml",
        ];

        const tomls: typeToml[] = [];

        // load both of toml files
        for (const file of tomlFiles) {
            const tomlPath = await fn.expand(
                args.denops,
                TomlFilesDir + "/" + file,
            );

            // read plugins from the toml file to variable toml
            const toml = (await args.dpp.extAction(
                args.denops,
                context,
                options,
                "toml",
                "load",
                {
                    path: tomlPath,
                    options: {
                        lazy: file === "dpp_lazy.toml",
                        //frozen: true,
                    },
                },
            )) as typeToml | undefined;

            if (toml) {
                tomls.push(toml);
            }
        }

        //integrate plugins into Record
        const recordPlugins: Record<string, Plugin> = {};

        tomls.forEach((toml) => {
            for (const plugin of toml.plugins ?? []) {
                recordPlugins[plugin.name] = plugin;
            }
        });

        // ---------------------------------------------------------------------
        // 4. lazy 拡張の実行と結果の返却
        // ---------------------------------------------------------------------

        type LazyMakeStateResult = {
            plugins: Plugin[];
            stateLines: string[];
        };

        const lazyResult = (await args.dpp.extAction(
            args.denops,
            context,
            options,
            "lazy",
            "makeState",
            {
                plugins: Object.values(recordPlugins),
            },
        )) as LazyMakeStateResult | undefined;

        //console.log(lazyResult);

        return {
            ftplugins: {},
            hooksFiles: [],
            plugins: lazyResult?.plugins ?? [],
            stateLines: lazyResult?.stateLines ?? [],
        };
    }
}
