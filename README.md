# PojavXMojo — Android launcher project bootstrap

This starter repository prepares a GitHub Actions build for the Android
Minecraft Java launcher engine Amethyst-Android.

## Important: what this starter pack does

- Fetches the upstream Amethyst-Android source (including its submodules).
- Runs the upstream Android debug build on GitHub Actions.
- Uploads the resulting APK as a workflow artifact.

**This is a build bootstrap, not yet a fully rebranded PojavXMojo app.**
The first successful workflow currently builds the upstream engine. The
PojavXMojo application name, package ID, purple UI, icons and feature changes
must be implemented in the engine source in a subsequent customization step.

## Install

1. Create/open: https://github.com/revengopb/PojavXMojo
2. Upload the contents of this ZIP to the repository root. Make sure the
   `.github/workflows/android-build.yml` file is included.
3. Commit the files to the `main` branch.
4. Open the repository's **Actions** tab.
5. Select **PojavXMojo Android Build** and choose **Run workflow**.
6. When it finishes, open the workflow run and download the
   `PojavXMojo-engine-debug-apk` artifact.

Pushes to `main` also trigger the workflow automatically.

## Upstream engine and build command

Upstream: https://github.com/AngelAuraMC/Amethyst-Android

Build task documented upstream:
`./gradlew :app_pojavlauncher:assembleDebug`

The upstream project uses recursive Git submodules and prebuilt JRE components
provided by its CI. Review its current README and license before distributing
modified builds.

## Planned PojavXMojo customization

1. Set the app display name to `PojavXMojo`.
2. Set a unique application ID after checking it does not conflict with an
   existing installed app.
3. Apply a purple/black theme and custom launcher icon.
4. Customize the home screen and navigation.
5. Add and test mod/resource-pack discovery and cosmetics integrations.
6. Test installation, login, game launch, controls, rendering and updates on
   supported Android devices.

Do not claim these features are implemented until their code is added and
tested. Keep upstream license notices, copyright notices and attribution.
