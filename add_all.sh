mason add vscode --git-url https://github.com/refectco/bricks --git-path vscode
mason add icons --git-url https://github.com/refectco/bricks --git-path icons
mason add init_app --git-url https://github.com/refectco/bricks --git-path init_app
mason add go_router --git-url https://github.com/refectco/bricks --git-path go_router

mason make vscode
mason make icons
mason make init_app -c config.json
mason make go_router  -c config.json