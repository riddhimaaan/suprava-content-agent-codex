---
name: x-content-writer
description: "Write high-performing X (Twitter) content - single tweets or threads - for any niche. Uses the STAR framework, strong hooks, and clear engagement structure."
allowed-tools: Read
---

# X content writer

Write tweets and threads that stop the scroll and drive engagement for any topic, any niche.

## Reference files

Before writing, read and internalize these files in the same directory:
- `copy-principles.md` - hooks, CTAs, formatting, psychological triggers
- `writing-principles.md` - core writing quality rules

---

## Core guardrail

Structure and writing quality are separate:

| Source | What it provides | What it does NOT provide |
|---|---|---|
| STAR framework (mandatory) | Content skeleton - Situation, Task, Action, Result, plus hook and CTA placement | Tone, sentence quality, phrasing |
| `copy-principles.md` + `writing-principles.md` | Hook strength, tone, formatting, readability, engagement mechanics | Structure |

The STAR framework decides what each part of the tweet or thread needs to do. The writing principles decide how that part should sound on X.

---

## When invoked from the research pipeline

If this skill is triggered from a research brief (via the `/suprava-content-agent` skill), the topic, goal, and audience are already established. In that case:
- Skip Step 1 clarifying questions that the research brief already answers
- Go straight to STAR structure, format, and hook selection
- Use the specific story, names, numbers, and outcomes from the research brief as the raw material

---

## Step 1 - Understand the input

Extract from the user's request:
- **Topic / idea** - what is this tweet about?
- **Goal** - inform, entertain, share insight, drive DMs/clicks, build authority?
- **Audience** - who should care about this?

If the user only gives a vague topic (for example, "write a tweet about AI tools"), ask one clarifying question: "What's the core insight or angle you want to hit?"

---

## Step 2 - Apply the STAR framework

Every output follows STAR, whether it is a single tweet or a thread.

| Beat | Purpose | X execution |
|---|---|---|
| **Situation** | Set up the reader's problem, tension, or interesting context | The hook plus 1 short supporting line if needed |
| **Task** | Clarify what needed to happen, change, or be understood | 1 sharp line that raises the stakes or frames the challenge |
| **Action** | Show what was done, learned, or recommended | The core insight, process, steps, or breakdown |
| **Result** | Land the payoff | Outcome, lesson, shift in thinking, proof, or closing line |

**Hook position:** The hook always sits at the top of Situation. It must work as a standalone first line with no warmup.

**CTA position:** The CTA comes after Result when a CTA is needed. If the post is stronger without one, end on the closing line instead.

**How STAR maps to format:**
- **Single tweet:** compress Situation, Task, Action, and Result into one tight unit
- **Short thread (3-5 tweets):** Tweet 1 handles Situation + Task, middle tweets handle Action, final tweet handles Result + CTA
- **Long thread (6-10 tweets):** Tweet 1 handles Situation + Task, the middle expands Action across multiple beats, the last tweet lands Result + CTA

---

## Step 3 - Choose the format

Pick the format that fits the content. Don't default to one.

| Format | When to use |
|---|---|
| **Single tweet** | One punchy insight, hot take, observation, or announcement |
| **Short thread (3-5 tweets)** | Explaining a process, listing tools/tips, case study with steps |
| **Long thread (6-10 tweets)** | Deep dive, story arc, comprehensive breakdown |

**Rule:** If the idea can land in one tweet, don't make it a thread. Threads are for content that genuinely needs multiple beats to deliver value.

---

## Step 4 - Choose the hook type

Pick the hook pattern that fits the content. Reference the hook section in `copy-principles.md`.

Common hook types:
- **Bold claim** - "This tool replaced my entire stack"
- **Curiosity gap** - "Almost nobody sees this part of X..."
- **Contrarian take** - "Stop doing X. Here's why."
- **Specific result** - "600 to 6K followers in 13 days came from this"
- **Direct address** - "You're leaving money on the table if you're not doing X"
- **Story opener** - "This happened last week..."

---

## Step 5 - Choose the CTA

Match the CTA to the content type:

| Content type | CTA style |
|---|---|
| Giveaway / resource | "Comment [WORD] + follow and I'll DM you the [resource]" |
| Link content | "Full breakdown here: [link]" or "Thread below" |
| Opinion / hot take | "Agree or disagree? Drop it below." |
| Story / value post | "Follow for more like this." or no CTA |
| Question / poll | End with an open question to drive replies |

---

## Step 6 - Write the content

Apply all rules from `copy-principles.md` and `writing-principles.md`:
- Hook in the first line - no warmup
- Short paragraphs (1-2 lines max)
- Active voice, contractions, conversational tone
- Specific numbers over vague claims
- Line breaks for breathing room
- No fluff, no disclaimers, no hedging
- Make every line belong to a STAR beat, even if the labels are not shown

For threads: Tweet 1 must establish Situation + Task. Middle tweets deliver Action. Final tweet lands Result and, if appropriate, CTA.

---

## Step 7 - Output format

Present the output clearly:

```
FORMAT: [Single Tweet / Thread - X tweets]
HOOK TYPE: [name of hook used]
CTA TYPE: [type of CTA]

---

[Tweet content here]

---

[If thread, each tweet numbered and separated]
```

---

## Step 8 - Humanizer pass (mandatory - runs automatically)

After producing the output in Step 7, run a humanizer pass before delivering to the user.

1. Read `skills/humanizer/system.md` in full
2. Use `copy-principles.md` and `writing-principles.md` as the calibration reference for hook sharpness, number specificity, CTA rhythm, readability, and paragraph length
3. Follow the draft -> audit -> final process defined in the humanizer
4. Deliver only the final humanized content - do not show the pre-humanized draft

After delivering the final humanized output, offer: "Want a variation with a different hook or format?"

If the user asks for a variation, write it and run the humanizer pass again before delivering.

---

## Hard rules

- Never start with "I" as the first word - weak opener
- Never use "Most people..." as the hook - market fatigued
- Never wall-of-text - always use line breaks
- Never hedge ("this might help", "I think maybe") - write with confidence
- Never write a thread when one tweet does the job
- Never break the STAR flow, even when the post is short
- Always end with either a strong CTA or a strong closing line - no fade-outs
- Emojis are optional - use only if they add visual rhythm, not for decoration
