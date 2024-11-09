default: ## Build all packages
	cd packages/core && pnpm build
	cd packages/vanilla && pnpm build
	cd packages/react && pnpm build
	cd packages/svelte && pnpm build
	cd packages/vanilla_hcaptcha && pnpm build

build: default ## Build all packages

docs: ## Build documentation for all packages
	@-/bin/rm -rf doc
	@-mkdir doc
	cd packages/core && pnpm doc
	cd packages/vanilla && pnpm doc
	cd packages/react && pnpm doc
	cd packages/svelte && pnpm doc
	cd packages/vanilla_hcaptcha && pnpm doc
	cp -r ./packages/core/docs doc/core-glue
	cp -r ./packages/vanilla/docs doc/vanilla
	cp -r ./packages/react/docs doc/react
	cp -r ./packages/svelte/docs doc/svelte
	cp -r ./packages/vanilla_hcaptcha/docs doc/vanilla_hcaptcha

clean: ## Remove all dependencies and build cache
	cd packages/core && /bin/rm -rf node_modules
	cd packages/vanilla && /bin/rm -rf node_modules
	cd packages/react && /bin/rm -rf node_modules
	cd packages/svelte && /bin/rm -rf node_modules
	cd packages/vanilla_hcaptcha && /bin/rm -rf node_modules

install: ## Install dependencies for all packages
	cd packages/core && pnpm install
	cd packages/vanilla && pnpm install
	cd packages/react && pnpm install
	cd packages/svelte && pnpm install
	cd packages/vanilla_hcaptcha && pnpm install

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

test: ## Test all packages
	cd packages/core && pnpm test
	cd packages/vanilla && pnpm test
	cd packages/react && pnpm test
	cd packages/svelte && pnpm test
	cd packages/vanilla_hcaptcha && pnpm test
