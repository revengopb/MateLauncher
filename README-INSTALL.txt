# MateLauncher branding build files

This ZIP is intended for your renamed MateLauncher GitHub repository.

## What is included
- `.github/workflows/android-build.yml` — builds the Android APK through GitHub Actions.
- `scripts/brand-matelauncher.sh` — changes the Android app display name from Amethyst to MateLauncher in the source cloned by the workflow.

## Install into your GitHub repository
1. Download and extract this ZIP.
2. Open your MateLauncher repository on GitHub.
3. Upload the **contents** of this extracted folder into the repository root.
   - Make sure `.github/workflows/android-build.yml` keeps its exact folder path.
   - Make sure `scripts/brand-matelauncher.sh` keeps its exact folder path.
4. If GitHub asks whether to replace the existing workflow file, choose replace.
5. Commit the changes to the `main` branch.
6. Open **Actions** and run/check **MateLauncher Android Build**.

The workflow clones the Amethyst Android source into a temporary `engine` folder during the build, applies the app-name change there, and uploads `MateLauncher.apk` as an Actions artifact.

## Important
This changes the Android app's visible name and APK filename. It does not yet redesign the launcher UI, change the application package ID, or diagnose/fix the earlier installation parsing error. Keep the same signing key if you later want updates to install over an existing app.
