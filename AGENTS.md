# Repository instructions

## Keep secrets out of Git and shared artifacts

- Never commit, push, upload, or paste live credentials. This includes printer
  LAN access codes, Bambu/cloud session and refresh tokens, API keys, passwords,
  cookies, authorization headers, private keys, and credential-bearing URLs.
- Keep credentials in an OS credential store or an ignored local file outside
  generated print assets. Use clearly fake placeholders in examples. Do not
  copy `~/.config/BambuStudio/`, account/device settings, browser profiles,
  `.env` files, or printer connection files into this repository.
- Treat printer serial numbers and private network addresses as local connection
  details. Exclude them from shared presets, manifests, logs, screenshots and
  download bundles unless the user explicitly requests their inclusion.
- Scan generated files as well as source. Inspect the contents of `.3mf` and
  `.zip` archives, including nested projects, JSON/XML metadata and G-code.
  Review screenshots for credentials before adding them. Printer/model presets
  must contain manufacturing settings only, without connection credentials.
- Do not print secret values during an audit. Use redacted scanner output and
  report only the path, line, rule and remediation. Keep scan reports outside
  the repository; even redacted reports may contain sensitive context.

## Before committing or pushing

1. Review `git status --short`, the complete intended diff and all newly added
   files. Use explicit paths when staging. Check `git ls-files -ci
   --exclude-standard` for tracked files that should be ignored; `.gitignore`
   does not protect files already tracked.
2. Run the repository's Gitleaks wrapper, which explicitly unpacks ZIP and
   `.3mf` files by their contents. Gitleaks archive flags alone miss `.3mf`
   contents. It checks Git-visible current files, the staged diff and the
   actual staged archive bytes, even if the working copy is different. Before
   a push, include all local history and historical archives:

   ```sh
   python3 scripts/check-secrets.py
   python3 scripts/check-secrets.py --history
   git diff --cached --check
   ```

3. Manually check printer-specific connection fields and shared images; a clean
   scan is evidence, not a guarantee. Install the checksum-pinned scanner with
   `python3 scripts/install-gitleaks.py`; it stays in ignored `.local/bin/`.
   If installation fails, report the check as incomplete. A temporary verified
   binary can be passed with `--gitleaks
   /path/to/gitleaks`. Do not claim a clean scan that did not run. The wrapper
   skips symlinks rather than following them; review any changed symlinks and
   their intended targets separately.
4. Stop the commit or push if a real secret is found. Remove it from pending
   files and generated bundles and repeat the checks. For credentials already
   committed or shared, tell the user they need revocation/rotation; deleting
   the latest copy does not remove history. Do not silently rewrite shared
   history or broaden scanner exclusions to hide findings.
5. Report what was checked and any limits. Do not push merely because checks
   pass; stay within the user's requested publishing scope.

## Habitat and printer work

- Use the current candidate revision; do not mix `archive/` or sketch parts into
  production plates. Preserve the supplied STL orientations and source hashes.
- Match the actual material, printer, nozzle, plate and spool mapping before
  sending a job. The current starter projects use PLA; older candidate slices
  use PETG. Keep credentials and device identifiers out of exported projects.
- Preparing or slicing files does not authorize starting a physical print.
  An explicit request to start does; do not ask for the same authorization
  again. Verify the printer accepts the job before reporting it as started.
- Mesh thickness and physical fit remain unverified until measured/tested.
  Follow `docs/VERIFICATION.md`; do not mark release gates passed from a slice
  or software check alone.
- After tooling or artifact changes, run `python3 -m unittest discover -s tests`
  and `python3 scripts/package-starter.py --check`. Rebuild the starter ZIP with
  `python3 scripts/package-starter.py` when its guide or approved assets change.
  Re-slicing one part must preserve the other parts' recorded evidence. Use a
  separate `--output` directory for a different filament/profile.
