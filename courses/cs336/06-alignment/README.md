# 06 Alignment

## 学习目标

理解基础模型如何通过 prompting、SFT 和强化学习变成任务模型，并认识推理引擎在 rollout、reward 和训练循环中的作用。

## 对应课程

| Lecture | 主题 |
| --- | --- |
| 15 | Mid/Post-training: SFT and RLHF |
| 16 | Post-training: RLVR |
| 17 | Alignment and Multimodality |

## 课程资源

- [课程视频 Playlist](https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV)
- [Lecture 15: Mid/Post-training](resources/lecture-15-mid-post-training.pdf)
- [Lecture 16: Post-training RLVR](resources/lecture-16-post-training-rlvr.pdf)
- [Lecture 17 在线讲义: Alignment and Multimodality](https://cs336.stanford.edu/lectures/?trace=lecture_17)
- [Assignment 5 Handout](resources/assignment-5-alignment.pdf)
- [Assignment 5 Safety/RLHF Supplement](resources/assignment-5-safety-rlhf-supplement.pdf)
- [Assignment 5 官方仓库](https://github.com/stanford-cs336/assignment5-alignment)

## Assignment

Assignment 5 的主线是 Reasoning RL：

- Zero-shot、Few-shot 和 Chain-of-Thought prompting；
- 使用 vLLM 为 OLMo-2-1B 生成 GSM8K rollout；
- 从数学推导到代码实现 on-policy GRPO；
- Reward、Advantage、Policy Gradient 和序列归一化；
- Dr. GRPO、Rejection Fine-Tuning 和 MaxRL；
- Off-policy importance weighting、clipping 和 GSPO；
- 比较不同策略梯度估计器的稳定性和效率；
- 可选 Safety/RLHF supplement，包括 DPO 等方法。

## 与推理工程的关系

Alignment 不是纯推理系统主题，但 RL rollout 是推理与训练耦合最紧密的场景之一。需要理解 vLLM serving、批量采样、权重同步、生成长度和训练吞吐之间的系统关系。

## 完成检查表

- [ ] 能区分 SFT、DPO、GRPO 和 RLVR 的目标与数据
- [ ] 能解释 rollout、reward、advantage 和 policy gradient
- [ ] 能说明 on-policy 与 off-policy 的效率和偏差权衡
- [ ] 能画出 vLLM rollout 与训练 Worker 的数据流
- [ ] 能解释生成长度和采样策略如何影响 RL 系统吞吐
