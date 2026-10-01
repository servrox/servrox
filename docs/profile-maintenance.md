# Maintaining this profile

The public profile lives in `README.md`. Identity, featured repositories, palette,
and focus areas live in the tracked `config.yml`. The SVGs are generated files;
edit the configuration or generator rather than the SVGs themselves.

## Automatic updates

`Generate Profile SVGs` tests the generator, then refreshes all sixteen images
from real GitHub data at 04:23 and 16:23 UTC. It also runs after relevant changes
on `main`, or from Actions → Generate Profile SVGs → Run workflow. GitHub may
delay scheduled runs. Pull requests run validation with read-only permissions.

Generation uses the workflow's built-in `GITHUB_TOKEN`; no personal access token
or additional secret is needed. If GitHub data cannot be read, generation fails
and the previously committed images stay visible. Assets are only committed
when their contents change. The repository's existing Security Baseline remains
in place.

## Edit and validate locally

Use Linux Python 3.12 or newer and an isolated environment:

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements-dev.txt
.venv/bin/python -m compileall -q generator tools tests
.venv/bin/python -m pytest -q -o addopts=--tb=short
```

Without a token, `.venv/bin/python -m generator.main` reads public REST data but
cannot draw the contribution calendar. Prefer the Actions workflow for complete
updates. `--demo` uses upstream sample data and must not be used for publication.

Each section has dark, light, mobile, and mobile-light variants, selected by the
README's `<picture>` elements. Motion follows the visitor's reduced-motion
preference; set `motion: false` for static artwork. Repository language shares
describe public code volume, not skill levels.

The upstream example config, README template, changelog, tests, and source fonts
are retained as reference material. See `NOTICE.md` for the pinned source and
license credits. The custom workflow and profile content are maintained here;
upstream changes should be reviewed before copying them in.
