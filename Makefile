ENV=dev

init:
	rm -rf .git
	git init
ifdef GIT
	git remote add origin $(GIT)
endif
	fvm use stable -p
	fvm flutter create .
	fvm flutter pub add \
		easy_localization \
		dio \
		retrofit \
		json_annotation \
		copy_with_extension \
		get_it \
		injectable \
		flutter_riverpod \
		auto_route

setup:
	fvm use
	fvm flutter pub get

generate:
	fvm dart run build_runner build --delete-conflicting-outputs

watch:
	fvm dart run build_runner watch --delete-conflicting-outputs

localization:
	fvm dart run easy_localization:generate \
		--output-dir=lib/app/localizations \
		--output-file=localizations.g.dart \
		--format=json \
		--source-dir=assets/translations
	fvm dart run easy_localization:generate -f keys \
		--output-dir=lib/app/localizations \
		--output-file=locale_keys.g.dart \
		--source-dir=assets/translations

clean:
	fvm flutter clean
	fvm flutter pub get
	@make generate
	@make localization