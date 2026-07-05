# CS336 Learning Path Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a locally browsable CS336 learning path with six topic sections, official PDFs, assignment summaries, video links, and an idempotent setup script for untracked starter code.

**Architecture:** Keep curated learning material under `courses/cs336/`, with one README per topic and downloaded PDFs in section-local `resources/` directories. Keep assignment code outside Git in `courses/cs336/workspace/`, populated and updated by one root setup script.

**Tech Stack:** Markdown, POSIX-compatible Bash, Git, curl, uv

---

### Task 1: Scaffold navigation and resource indexes

**Files:**
- Create: `courses/cs336/README.md`
- Create: `courses/cs336/01-basics/README.md`
- Create: `courses/cs336/02-systems/README.md`
- Create: `courses/cs336/03-inference/README.md`
- Create: `courses/cs336/04-scaling/README.md`
- Create: `courses/cs336/05-data/README.md`
- Create: `courses/cs336/06-alignment/README.md`
- Modify: `README.md`
- Modify: `.gitignore`

- [ ] **Step 1: Add the top-level CS336 guide**

Create `courses/cs336/README.md` with:

- course positioning and Spring 2026 version note;
- official course page: `https://cs336.stanford.edu/`;
- official playlist: `https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV`;
- links to all six local sections;
- recommended priority for inference interviews;
- explanation that PDFs are committed while code lives in ignored `workspace/`;
- command `./setup.sh`.

- [ ] **Step 2: Create the six section indexes**

Each section README must contain these headings:

```markdown
## 学习目标
## 对应课程
## 课程资源
## Assignment
## 与推理工程的关系
## 完成检查表
```

Use these mappings:

- `01-basics`: lectures 1-4, Assignment 1;
- `02-systems`: lectures 5-8, Assignment 2;
- `03-inference`: lecture 10, no standalone assignment;
- `04-scaling`: lectures 9 and 11, Assignment 3;
- `05-data`: lectures 12-14, Assignment 4;
- `06-alignment`: lectures 15-17, Assignment 5 and optional safety supplement.

Every local PDF link must use `resources/<filename>.pdf`. Executable lecture links use:

```text
https://cs336.stanford.edu/lectures/?trace=lecture_01
https://cs336.stanford.edu/lectures/?trace=lecture_02
https://cs336.stanford.edu/lectures/?trace=lecture_06
https://cs336.stanford.edu/lectures/?trace=lecture_07
https://cs336.stanford.edu/lectures/?trace=lecture_10
https://cs336.stanford.edu/lectures/?trace=lecture_12
https://cs336.stanford.edu/lectures/?trace=lecture_13
https://cs336.stanford.edu/lectures/?trace=lecture_14
https://cs336.stanford.edu/lectures/?trace=lecture_17
```

Link each lecture title to the course schedule so the README remains useful if an individual preview moves.

- [ ] **Step 3: Add repository navigation and ignore workspace code**

Add this item to the root `README.md` Guides section:

```markdown
- [Stanford CS336 学习路径](courses/cs336/README.md)
```

Add this exact ignore entry to `.gitignore`:

```gitignore
courses/cs336/workspace/
```

- [ ] **Step 4: Verify document structure**

Run:

```bash
rg -l '^## 学习目标$' courses/cs336/*/README.md
```

Expected: six section README files.

Run:

```bash
rg -n 'courses/cs336/README.md|courses/cs336/workspace/' README.md .gitignore
```

Expected: one root navigation link and one ignore rule.

### Task 2: Add the assignment workspace setup script

**Files:**
- Create: `courses/cs336/setup.sh`

- [ ] **Step 1: Implement the idempotent setup script**

Create `courses/cs336/setup.sh` with this behavior:

```bash
#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="${SCRIPT_DIR}/workspace"

command -v git >/dev/null 2>&1 || {
  echo "git is required." >&2
  exit 1
}

command -v uv >/dev/null 2>&1 || {
  echo "uv is required. Install it from https://docs.astral.sh/uv/getting-started/installation/" >&2
  exit 1
}

mkdir -p "${WORKSPACE_DIR}"

repos=(
  assignment1-basics
  assignment2-systems
  assignment3-scaling
  assignment4-data
  assignment5-alignment
)

for repo in "${repos[@]}"; do
  target="${WORKSPACE_DIR}/${repo}"
  url="https://github.com/stanford-cs336/${repo}.git"

  if [[ -d "${target}/.git" ]]; then
    echo "Updating ${repo}..."
    git -C "${target}" pull --ff-only
  elif [[ -e "${target}" ]]; then
    echo "${target} exists but is not a Git repository." >&2
    exit 1
  else
    echo "Cloning ${repo}..."
    git clone "${url}" "${target}"
  fi

  echo "Syncing ${repo} dependencies..."
  uv sync --directory "${target}"
done

echo "CS336 assignment workspaces are ready in ${WORKSPACE_DIR}."
```

- [ ] **Step 2: Make the script executable and validate syntax**

Run:

```bash
chmod +x courses/cs336/setup.sh
bash -n courses/cs336/setup.sh
```

Expected: `bash -n` exits with status 0 and prints no output.

- [ ] **Step 3: Verify the workspace is ignored**

Run:

```bash
git check-ignore courses/cs336/workspace/
```

Expected: prints `courses/cs336/workspace/`.

Do not run the full setup during repository creation because it downloads five code repositories and all Python dependencies. The script is verified structurally; the user runs it when starting assignments.

### Task 3: Download official course PDFs

**Files:**
- Create: `courses/cs336/01-basics/resources/assignment-1-basics.pdf`
- Create: `courses/cs336/01-basics/resources/lecture-03-architectures-hyperparameters.pdf`
- Create: `courses/cs336/01-basics/resources/lecture-04-attention-alternatives-moe.pdf`
- Create: `courses/cs336/02-systems/resources/assignment-2-systems.pdf`
- Create: `courses/cs336/02-systems/resources/lecture-05-gpus-tpus.pdf`
- Create: `courses/cs336/02-systems/resources/lecture-08-parallelism.pdf`
- Create: `courses/cs336/04-scaling/resources/assignment-3-scaling.pdf`
- Create: `courses/cs336/04-scaling/resources/lecture-09-scaling-laws-basics.pdf`
- Create: `courses/cs336/04-scaling/resources/lecture-11-scaling-laws.pdf`
- Create: `courses/cs336/05-data/resources/assignment-4-data.pdf`
- Create: `courses/cs336/06-alignment/resources/assignment-5-alignment.pdf`
- Create: `courses/cs336/06-alignment/resources/assignment-5-safety-rlhf-supplement.pdf`
- Create: `courses/cs336/06-alignment/resources/lecture-15-mid-post-training.pdf`
- Create: `courses/cs336/06-alignment/resources/lecture-16-post-training-rlvr.pdf`

- [ ] **Step 1: Create resource directories**

```bash
mkdir -p \
  courses/cs336/01-basics/resources \
  courses/cs336/02-systems/resources \
  courses/cs336/04-scaling/resources \
  courses/cs336/05-data/resources \
  courses/cs336/06-alignment/resources
```

- [ ] **Step 2: Download assignment handouts**

Download from these official raw GitHub URLs:

```text
https://raw.githubusercontent.com/stanford-cs336/assignment1-basics/main/cs336_assignment1_basics.pdf
https://raw.githubusercontent.com/stanford-cs336/assignment2-systems/main/cs336_assignment2_systems.pdf
https://raw.githubusercontent.com/stanford-cs336/assignment3-scaling/main/cs336_assignment3_scaling.pdf
https://raw.githubusercontent.com/stanford-cs336/assignment4-data/main/cs336_assignment4_data.pdf
https://raw.githubusercontent.com/stanford-cs336/assignment5-alignment/main/cs336_spring2026_assignment5_alignment.pdf
https://raw.githubusercontent.com/stanford-cs336/assignment5-alignment/main/cs336_spring2026_assignment5_supplement_safety_rlhf.pdf
```

Use `curl -fL <url> -o <section-resource-path>` so HTTP failures do not leave apparently valid files.

- [ ] **Step 3: Download lecture PDFs**

Download `lecture_03.pdf`, `lecture_04.pdf`, `lecture_05.pdf`, `lecture_08.pdf`, `lecture_09.pdf`, `lecture_11.pdf`, `lecture_15.pdf`, and `lecture_16.pdf` from:

```text
https://raw.githubusercontent.com/stanford-cs336/lectures/main/<filename>
```

Save them using the descriptive filenames listed in the Files section.

- [ ] **Step 4: Validate all PDFs**

Run:

```bash
find courses/cs336 -path '*/resources/*.pdf' -type f -size +10k
```

Expected: 14 files.

Run:

```bash
find courses/cs336 -path '*/resources/*.pdf' -type f -exec file {} \;
```

Expected: every line contains `PDF document`.

### Task 4: Final verification and commit

**Files:**
- Verify all files created or modified in Tasks 1-3

- [ ] **Step 1: Check links and expected files**

Run:

```bash
rg -n 'resources/.*\\.pdf|youtube.com|cs336.stanford.edu/lectures' courses/cs336/*/README.md
```

Expected: every local PDF is linked from its section and every executable lecture section has an online link.

Run:

```bash
test ! -d courses/cs336/workspace
```

Expected: exit status 0; assignment code has not been downloaded into the repository during setup.

- [ ] **Step 2: Check shell and Git formatting**

Run:

```bash
bash -n courses/cs336/setup.sh
git diff --check
git status --short
```

Expected: shell syntax and diff checks pass; status lists only the intended CS336 resources, README, and `.gitignore`.

- [ ] **Step 3: Commit the learning path**

```bash
git add .gitignore README.md courses/cs336
git commit -m "docs: add CS336 learning path"
```

Expected: one commit containing the six-section guide, setup script, and 14 official PDFs.
