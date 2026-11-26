#!/usr/bin/env bash
set -euo pipefail

ENGINE_DIR="${1:-engine}"
STRINGS_FILE="$ENGINE_DIR/app_pojavlauncher/src/main/res/values/strings.xml"

if [[ ! -f "$STRINGS_FILE" ]]; then
  echo "ERROR: Could not find $STRINGS_FILE"
  exit 1
fi

python3 - "$STRINGS_FILE" <<'PY'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

pattern = r'(<string\s+name="app_name"[^>]*>).*?(</string>)'
updated, count = re.subn(pattern, r'\1MateLauncher\2', text, count=1, flags=re.S)

if count != 1:
    raise SystemExit("ERROR: app_name string was not found; source layout may have changed.")

path.write_text(updated, encoding="utf-8")
print("Updated Android app label: MateLauncher")

# Also update the foreground-service notification title where present.
service_pattern = r'(<string\s+name="lazy_service_default_title"[^>]*>).*?(</string>)'
updated, service_count = re.subn(
    service_pattern, r'\1MateLauncher\2', updated, count=1, flags=re.S
)
if service_count:
    path.write_text(updated, encoding="utf-8")
    print("Updated foreground service title: MateLauncher")
PY

echo "Branding check:"
grep -nE 'name="(app_name|lazy_service_default_title)"' "$STRINGS_FILE"
