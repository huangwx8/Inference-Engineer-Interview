# CS336 学习路径目录设计

## 目标

在仓库中新增一个面向推理工程师准备的 CS336 学习区，将课程内容按学习路径而不是原始课次组织，方便依次完成模型基础、系统优化、推理、Scaling、数据和 Alignment。

资源保存遵循以下原则：

- 官方 PDF 下载到仓库，支持离线阅读；
- 视频、在线 preview 和 executable lecture 仅保存链接；
- assignment starter code 不提交到资料仓库；
- 使用一个 `setup.sh` 将官方 assignment 仓库下载到被 Git 忽略的本地目录。

## 目录结构

```text
courses/cs336/
├── README.md
├── setup.sh
├── 01-basics/
│   ├── README.md
│   └── resources/
├── 02-systems/
│   ├── README.md
│   └── resources/
├── 03-inference/
│   └── README.md
├── 04-scaling/
│   ├── README.md
│   └── resources/
├── 05-data/
│   ├── README.md
│   └── resources/
├── 06-alignment/
│   ├── README.md
│   └── resources/
└── workspace/
```

`workspace/` 由 `setup.sh` 创建，并通过仓库 `.gitignore` 排除。

## Section 内容

每个 Section README 使用统一结构：

1. 本节目标；
2. 对应课程讲次；
3. 视频和在线讲义；
4. 本地 PDF；
5. Assignment 任务拆解；
6. 与推理工程岗位的关系；
7. 完成检查表。

### 01 Basics

覆盖 Tokenization、PyTorch 资源估算、Transformer 架构、Attention alternatives 和 MoE。

本地资源：

- Assignment 1 handout；
- Architecture and hyperparameters 讲义；
- Attention alternatives and mixture of experts 讲义。

### 02 Systems

覆盖 GPU/TPU、Kernel、Triton、Profiling、FlashAttention、Activation Checkpointing 和并行训练。

本地资源：

- Assignment 2 handout；
- GPUs and TPUs 讲义；
- Parallelism 讲义。

Kernel/Triton 和部分 Parallelism 内容为 executable lecture，只在 README 中保存在线 preview 与视频链接。

### 03 Inference

单独收录 Inference Lecture，突出资源估算、KV Cache、batching、吞吐/延迟权衡和推理系统设计。

该讲为 executable lecture，没有官方 PDF，因此只保存在线 preview、源材料和视频链接，不创建空的 `resources/`。

### 04 Scaling

覆盖 IsoFLOPs、Scaling Laws、计算最优模型、训练预算和实验设计。

本地资源：

- Assignment 3 handout；
- 两次 Scaling Laws 讲义。

### 05 Data

覆盖 Common Crawl、HTML 提取、语言与质量过滤、PII、有害内容、去重和数据效果验证。

本地资源：

- Assignment 4 handout。

Data lectures 为 executable lecture，只在 README 中保存在线 preview 与视频链接。

### 06 Alignment

覆盖 SFT/RLHF、RLVR、GRPO、off-policy RL 和多模态 Alignment。

本地资源：

- Assignment 5 handout；
- Assignment 5 Safety/RLHF supplement；
- Mid/post-training 讲义；
- Post-training RLVR 讲义。

多模态 Alignment 为 executable lecture，只保存在线链接。

## 顶层 README

`courses/cs336/README.md` 提供：

- 课程定位与版本说明；
- 官方课程页、YouTube playlist 和作业组织链接；
- 六个 Section 的推荐顺序和入口；
- 面向推理工程面试的优先级：完整完成 Basics，深挖 Systems 和 Inference，选择性完成其余部分；
- 本地 PDF 与 `workspace/` 的使用说明；
- `setup.sh` 的运行方法。

仓库根目录 `README.md` 增加 CS336 学习路径入口。

## Setup 脚本

`courses/cs336/setup.sh` 的行为：

1. 使用严格 Shell 模式；
2. 检查 `git` 和 `uv` 是否可用，不可用时输出明确安装提示并退出；
3. 创建 `courses/cs336/workspace/`；
4. 首次运行时 clone 五个官方 assignment 仓库；
5. 后续运行时对每个仓库执行 fast-forward-only pull；
6. 在每个 assignment 仓库中运行 `uv sync`；
7. 任一仓库失败时停止，并显示失败的 assignment。

脚本必须幂等，不修改学习资料目录，也不自动覆盖本地 assignment 改动。

## PDF 来源与命名

PDF 仅从 Stanford CS336 官方 GitHub 组织下载，并使用稳定、可读的文件名：

- `assignment-1-basics.pdf`
- `lecture-03-architectures-hyperparameters.pdf`
- `lecture-04-attention-alternatives-moe.pdf`
- `assignment-2-systems.pdf`
- `lecture-05-gpus-tpus.pdf`
- `lecture-08-parallelism.pdf`
- `assignment-3-scaling.pdf`
- `lecture-09-scaling-laws-basics.pdf`
- `lecture-11-scaling-laws.pdf`
- `assignment-4-data.pdf`
- `assignment-5-alignment.pdf`
- `assignment-5-safety-rlhf-supplement.pdf`
- `lecture-15-mid-post-training.pdf`
- `lecture-16-post-training-rlvr.pdf`

下载后验证文件存在、非空、文件类型为 PDF，并在对应 README 中使用相对链接。

## 非目标

- 不提交 Stanford assignment starter code；
- 不保存公开视频文件；
- 不复制第三方解答；
- 不为 executable lecture 生成非官方 PDF；
- 不在 `setup.sh` 中自动安装系统软件或云端 GPU 环境；
- 不自动运行需要 GPU、数据集或 Stanford 内部 API 的实验。

## 完成标准

- 六个 Section 均可从顶层 CS336 README 导航；
- 每个 README 都包含统一的七类信息；
- 所有声明为本地资源的 PDF 均可打开且来源为官方仓库；
- assignment code 只出现在被忽略的 `workspace/`；
- `setup.sh` 通过 Shell 语法检查，并且重复运行不会重复 clone；
- 根 README 能进入 CS336 学习路径；
- `git diff --check` 无格式错误。
