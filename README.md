# Suprava Content Agent for Codex

Research-first content plugin for Suprava's workflow.

This repository is packaged in the standard Codex marketplace layout:

- repo marketplace metadata in `.agents/plugins/marketplace.json`
- installable plugin bundle in `plugins/suprava-content-agent/`

The plugin researches real stories, campaign details, founder angles, and evidence, then hands those briefs to LinkedIn, X, and YouTube writing flows with a required humanizer pass.

## Install

### Standard Codex marketplace flow

Add the repository as a plugin marketplace:

```bash
codex plugin marketplace add riddhimaaan/suprava-content-agent-codex
```

Then open Codex and install the plugin from the plugin browser:

```text
/plugins
```

Inside the plugin browser:

1. Open the `suprava-content-agent-codex` marketplace
2. Select `suprava-content-agent`
3. Choose `Install`

Restart Codex after install if your build prompts for it.

### If your Codex build supports direct CLI install

Some Codex builds also support a direct install command:

```bash
codex plugin add suprava-content-agent@suprava-content-agent-codex
```

If that command is unavailable in your environment, use the standard marketplace flow above.

## What It Does

- Researches content ideas instead of returning generic advice
- Turns pasted posts or topics into source-backed research briefs
- Surfaces multiple headline angles when the input is broad
- Routes finalized research into LinkedIn, X, or YouTube writing workflows
- Saves finalized research briefs into story memory for future reuse

## Workflow

The main skill automatically detects the input type:

1. Full idea
2. Pasted post or story
3. Topic only
4. Open question

For content workflows, research always happens before writing.

- Mode 1 researches 1 to 3 supporting stories
- Mode 2 reconstructs the full context behind a referenced story
- Mode 3 first generates headline options, then deep-researches the user-selected angle
- Mode 4 answers open-ended research questions directly

After a final research brief is ready, the plugin can hand off to:

- LinkedIn writer
- X writer
- YouTube writer

Every platform output goes through the humanizer before delivery.

## Repository Structure

```text
.agents/
  plugins/
    marketplace.json
plugins/
  suprava-content-agent/
    .codex-plugin/
      plugin.json
    skills/
      suprava-content-agent/
install.ps1
install.sh
README.md
LICENSE
```

## Local Installers

This repo also includes local installers for direct installation from a checkout.

### Windows

```powershell
.\install.ps1
```

### macOS / Linux

```bash
bash install.sh
```

The local installers:

- copy the plugin bundle into your local Codex plugins directory
- update your personal marketplace at `~/.agents/plugins/marketplace.json`
- preserve existing story memory on reinstall

## Story Memory

Finalized research briefs are stored inside the installed plugin:

- Windows: `%USERPROFILE%\plugins\suprava-content-agent\skills\suprava-content-agent\memory\`
- macOS / Linux: `~/plugins/suprava-content-agent/skills/suprava-content-agent/memory/`

This includes:

- `INDEX.md` as the running story archive
- one dated markdown file per saved story

## Notes

- This repo is the Codex plugin package, not the original Claude plugin source repo
- Codex marketplace metadata lives at `.agents/plugins/marketplace.json`
- The installable plugin itself lives at `plugins/suprava-content-agent/`

## License

MIT
