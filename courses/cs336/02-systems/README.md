# 02 Systems

## 学习目标

建立 GPU 性能工程方法：先正确测量，再定位瓶颈，最后通过 Kernel、精度、内存和并行策略优化端到端效率。

## 对应课程

| Lecture | 主题 |
| --- | --- |
| 5 | GPUs and TPUs |
| 6 | Kernels and Triton |
| 7 | Parallelism |
| 8 | Parallelism |

## 课程资源

- [课程视频 Playlist](https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV)
- [Lecture 5: GPUs and TPUs](resources/lecture-05-gpus-tpus.pdf)
- [Lecture 6 在线讲义: Kernels and Triton](https://cs336.stanford.edu/lectures/?trace=lecture_06)
- [Lecture 7 在线讲义: Parallelism](https://cs336.stanford.edu/lectures/?trace=lecture_07)
- [Lecture 8: Parallelism](resources/lecture-08-parallelism.pdf)
- [Assignment 2 Handout](resources/assignment-2-systems.pdf)
- [Assignment 2 官方仓库](https://github.com/stanford-cs336/assignment2-systems)

## Assignment

Assignment 2 的实现与实验包括：

- 正确的 GPU benchmark：warmup、同步、平均值与方差；
- Nsight Systems 和显存 profiling；
- Mixed Precision 与 Activation Checkpointing；
- 用 Triton 实现并 benchmark FlashAttention-2；
- 从零实现 DDP，并进行梯度通信与计算重叠；
- Optimizer State Sharding 和 FSDP；
- 分析 DP、FSDP、TP 和二维并行的显存与通信成本；
- 优化最快训练 step。

## 与推理工程的关系

这是最接近推理优化岗位的作业。虽然 DDP/FSDP 以训练为场景，但 profiling、显存层次、Triton、FlashAttention、collective communication、sharding 和通信计算重叠都直接迁移到高性能推理。

## 完成检查表

- [ ] benchmark 能正确处理 CUDA 异步执行和 warmup
- [ ] 能用 Nsight Systems 定位 CPU/GPU 空洞与关键 Kernel
- [ ] 能区分 compute-bound 与 memory-bound
- [ ] 能解释 mixed precision 的性能收益和数值风险
- [ ] 完成 FlashAttention-2 Triton forward 并验证正确性
- [ ] 能推导 DP、FSDP 和 TP 的通信量与显存占用
- [ ] 能说明训练并行与推理并行的共同点和差异
