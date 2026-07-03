# Inference Engineer Knowledge Guide Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a Chinese Markdown knowledge guide that turns five inference-related roles shown across six screenshots into a reusable personal interview knowledge system.

**Architecture:** Keep the knowledge system in one reader-facing document organized as a six-layer capability map, with three specialization branches and a source-traceability table. Add a single README entry so the guide is discoverable without mixing implementation notes into the reader-facing document.

**Tech Stack:** Markdown, Git, `rg`

---

### Task 1: Write the layered knowledge guide

**Files:**
- Create: `docs/inference-engineer-knowledge-guide.md`
- Reference: `docs/superpowers/specs/2026-07-02-inference-engineer-knowledge-guide-design.md`

- [ ] **Step 1: Create the document frame**

Create `docs/inference-engineer-knowledge-guide.md` with these top-level sections in this order:

```markdown
# 推理工程师面试知识体系

## 如何使用这份 Guide
## 一、岗位本质：在约束下交付更高效的模型能力
## 二、六层核心知识体系
## 三、岗位分支
## 四、能力深度标准
## 五、如何从 JD 判断岗位侧重点
## 六、面试知识检查表
## 七、岗位样本的共同特征
```

- [ ] **Step 2: Write the role model and six knowledge layers**

Explain that inference engineering optimizes latency, throughput, cost, accuracy, reliability, and development efficiency together. Add these six subsections under `## 二、六层核心知识体系`:

```markdown
### 1. 计算机与系统基础
### 2. 大模型与生成模型原理
### 3. 加速硬件与高性能算子
### 4. 模型级推理优化
### 5. 推理引擎与运行时
### 6. 分布式推理与生产系统
```

For every layer, include all six labels:

```markdown
**目标**
**核心知识**
**典型技术**
**关键权衡**
**面试深度**
**边界说明**
```

Cover the following concepts in their natural layer:

- Linux, C/C++, Python, data structures, operating systems, networking, concurrency, distributed systems;
- Transformer, attention, KV Cache, autoregressive decoding, Diffusion, MoE, multimodal model execution;
- GPU architecture, memory hierarchy, CUDA, Triton, TileLang, kernel fusion, FlashAttention, MatMul, Grouped MatMul, profiling;
- quantization, sparsity, pruning, distillation, graph optimization, compilation, heterogeneous hardware adaptation;
- vLLM, SGLang, TensorRT-LLM, batching, scheduling, memory management, parallelism, communication;
- high availability, elasticity, observability, capacity planning, multi-region scheduling, resource utilization, cost control.

- [ ] **Step 3: Write specialization branches and depth levels**

Under `## 三、岗位分支`, add:

```markdown
### 1. 多模态与生成模型推理
### 2. 大规模训练推理基础设施
### 3. Agent 与业务 AI 基础设施
```

Keep shared concepts in the six-layer core and describe only specialization deltas. Include video/image/audio/3D execution for multimodal work; large GPU clusters, training frameworks, compilation and heterogeneous accelerators for infrastructure work; and data quality loops, evaluation, toolchains, knowledge bases and cost governance for Agent infrastructure.

Under `## 四、能力深度标准`, define the five levels exactly as:

1. 了解概念和用途；
2. 能解释核心原理与关键权衡；
3. 能实现最小可用版本；
4. 能分析性能并完成针对性优化；
5. 能设计、部署和负责生产级系统。

- [ ] **Step 4: Write JD interpretation, checklist, and evidence table**

Map JD signals to role emphasis:

| Signal | Emphasis |
| --- | --- |
| CUDA, Triton, TileLang, FlashAttention | 算子与硬件 |
| vLLM, SGLang, TensorRT-LLM | 推理引擎 |
| 调度, 通信, 高并发, 弹性, 高可用 | 分布式系统 |
| 量化, 蒸馏, 稀疏化, 剪枝 | 模型压缩 |
| Diffusion, 视频, 图像, 语音, 3D | 多模态 |
| Agent, 评测, 特征工程, 数据闭环 | 业务 AI 基础设施 |

Write the checklist as interview questions grouped by the six layers. End with a compact evidence table containing `能力主题`, `JD 覆盖度`, `对应知识层`, and `代表性关键词`. Use qualitative coverage values `全部`, `多数`, or `部分`; do not invent numeric frequencies when the screenshots do not support exact counting.

- [ ] **Step 5: Verify structure and content coverage**

Run:

```bash
rg -n '^## |^### ' docs/inference-engineer-knowledge-guide.md
```

Expected: all seven top-level sections, all six core layers, and all three specialization branches are present.

Run:

```bash
rg -n 'CUDA|Triton|vLLM|SGLang|TensorRT-LLM|量化|蒸馏|稀疏|Diffusion|Agent|高可用|成本' docs/inference-engineer-knowledge-guide.md
```

Expected: every listed topic appears at least once in the appropriate conceptual section.

### Task 2: Add repository navigation

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Add the guide link**

Keep the existing title and repository description, then add:

```markdown
## Guides

- [推理工程师面试知识体系](docs/inference-engineer-knowledge-guide.md)
```

- [ ] **Step 2: Verify Markdown links and working tree**

Run:

```bash
test -f docs/inference-engineer-knowledge-guide.md
rg -n 'docs/inference-engineer-knowledge-guide.md' README.md
git diff --check
```

Expected: the guide exists, README contains one matching link, and `git diff --check` prints no errors.

- [ ] **Step 3: Commit the reader-facing documentation**

```bash
git add README.md docs/inference-engineer-knowledge-guide.md
git commit -m "docs: add inference engineer knowledge guide"
```

Expected: one commit containing the guide and README navigation.
