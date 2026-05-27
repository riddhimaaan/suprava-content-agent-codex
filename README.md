# Suprava Content Agent for Codex

Research-first content plugin for Suprava's workflow.

This Codex plugin finds real stories, brand moments, campaign specifics, founder angles, and supporting evidence, then routes that research into platform-specific writing flows for LinkedIn, X, and YouTube with a mandatory humanizer pass at the end.

## What It Does

- Researches content ideas instead of generating generic advice
- Turns pasted posts or loose topics into source-backed research briefs
- Surfaces multiple headline angles when the input is broad
- Hands approved research into platform writers for LinkedIn, X, and YouTube
- Saves finalized research briefs into a reusable story memory archive

## Workflow

The plugin follows a research-first pipeline.

### 1. Research mode detection

The main skill automatically decides which mode fits the user's input:

1. Full idea
2. Pasted post or story
3. Topic only
4. Open question

### 2. Research before writing

For content work, research always comes first. The plugin does not jump straight into post writing.

- Mode 1 researches 1 to 3 supporting stories
- Mode 2 reconstructs the full story behind a pasted post or reference
- Mode 3 first surfaces headline options, then deep-researches the one the user chooses
- Mode 4 answers open-ended research questions directly

### 3. Platform handoff

After a final research brief is delivered, the plugin can hand the story off to:

- LinkedIn writer
- X writer
- YouTube writer

Every platform output goes through the humanizer before delivery.

## Included Skills

```text
skills/
  suprava-content-agent/
    SKILL.md
    references/
      content-themes.md
      output-format.md
      search-strategy.md
    memory/
      INDEX.md
    skills/
      linkedin-writer/
      x-writer/
      youtube-writer/
      humanizer/
```

## Installation

### Windows

Run:

```powershell
.\install.ps1
```

### macOS / Linux

Run:

```bash
bash install.sh
```

## What The Installer Does

The installer:

- copies this plugin into your local Codex plugins directory
- registers it in your personal plugin marketplace
- preserves saved story memory on reinstall

Installed location:

- Windows: `%USERPROFILE%\plugins\suprava-content-agent`
- macOS / Linux: `~/plugins/suprava-content-agent`

## Using The Plugin In Codex

After installing:

1. Restart Codex
2. Open `Plugins`
3. Install `Suprava Content Agent` from your personal marketplace
4. Start using it with prompts like:

```text
Research 5 angles on creator-led GTM.
```

```text
I saw a campaign from a brand using direct mail creatively. Research the full story.
```

```text
Turn this research brief into a LinkedIn post.
```

```text
Build a YouTube script from this research brief.
```

## Story Memory

Finalized research briefs are saved into the plugin's memory folder so old stories can be tracked and reused later.

Memory location:

- Windows: `%USERPROFILE%\plugins\suprava-content-agent\skills\suprava-content-agent\memory\`
- macOS / Linux: `~/plugins/suprava-content-agent/skills/suprava-content-agent/memory/`

This includes:

- `INDEX.md` as the running archive
- one dated markdown file per saved story

## Repository Structure

```text
.codex-plugin/
  plugin.json
skills/
  suprava-content-agent/
install.ps1
install.sh
README.md
LICENSE
```

## Notes

- This repository is the Codex plugin package, not the original Claude plugin source repo
- The runtime pieces Codex needs are `.codex-plugin/` and `skills/`
- Research briefs are source-backed by design and intended to feed downstream content creation

## License

MIT
