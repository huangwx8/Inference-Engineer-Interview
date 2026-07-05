# Stanford CS336 学习路径

这套目录基于 Stanford CS336: Language Modeling from Scratch（Spring 2026），按推理工程师的学习路径重新组织，而不是机械复刻课程周次。

## 官方入口

- [课程主页与 Schedule](https://cs336.stanford.edu/)
- [Spring 2026 YouTube Playlist](https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV)
- [课程讲义仓库](https://github.com/stanford-cs336/lectures)
- [Stanford CS336 GitHub Organization](https://github.com/stanford-cs336)

## 推荐顺序

| 顺序 | Section | 主要问题 | 推理面试优先级 |
| --- | --- | --- | --- |
| 1 | [Basics](01-basics/README.md) | 一个 Transformer LM 如何从零构建和训练？ | 必修 |
| 2 | [Systems](02-systems/README.md) | 如何测量、定位并优化 GPU 性能？ | 必修，重点深挖 |
| 3 | [Inference](03-inference/README.md) | 如何在延迟、吞吐和显存之间做系统权衡？ | 必修，重点深挖 |
| 4 | [Scaling](04-scaling/README.md) | 如何在算力预算下选择模型规模和实验？ | 建议完成 |
| 5 | [Data](05-data/README.md) | 训练数据如何被抽取、过滤和去重？ | 选择性完成 |
| 6 | [Alignment](06-alignment/README.md) | 推理引擎如何参与 SFT/RL 和 rollout？ | 选择性完成 |

## 使用方式

课程 PDF 已保存在各 Section 的 `resources/` 中。公开视频和 executable lecture 不复制到仓库，在各 Section README 中保留官方链接。

Assignment starter code 不进入本资料仓库。需要开始做作业时，在当前目录运行：

```bash
./setup.sh
```

脚本会把五个官方 assignment 仓库 clone 到被 Git 忽略的 `workspace/`，后续运行会更新仓库并执行 `uv sync`。

## 面向推理岗位的取舍

建议完整完成 Assignment 1，并把 Assignment 2 的 profiling、mixed precision、FlashAttention、通信与并行部分做透。Lecture 10 Inference 虽然没有独立作业，但应当单独整理实验和面试答案。Assignment 3 建议完成核心 Scaling Law；Assignment 4 和 5 根据目标岗位选择。

CS336 不是完整的计算机基础课程。操作系统、网络、C++、分布式服务和生产可靠性仍需在课程之外补齐。
