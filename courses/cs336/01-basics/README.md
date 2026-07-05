# 01 Basics

## 学习目标

从原始文本开始，理解 Tokenizer、Transformer、优化器和训练循环如何拼成一个真正可训练、可生成文本的语言模型。

## 对应课程

| Lecture | 主题 |
| --- | --- |
| 1 | Overview and Tokenization |
| 2 | PyTorch, FLOPs, Memory and Arithmetic Intensity |
| 3 | Architectures and Hyperparameters |
| 4 | Attention Alternatives and Mixture of Experts |

## 课程资源

- [课程视频 Playlist](https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV)
- [Lecture 1 在线讲义](https://cs336.stanford.edu/lectures/?trace=lecture_01)
- [Lecture 2 在线讲义](https://cs336.stanford.edu/lectures/?trace=lecture_02)
- [Lecture 3: Architectures and Hyperparameters](resources/lecture-03-architectures-hyperparameters.pdf)
- [Lecture 4: Attention Alternatives and MoE](resources/lecture-04-attention-alternatives-moe.pdf)
- [Assignment 1 Handout](resources/assignment-1-basics.pdf)
- [Assignment 1 官方仓库](https://github.com/stanford-cs336/assignment1-basics)

## Assignment

Assignment 1 要求从零实现：

- Byte-level BPE Tokenizer 训练、编码与解码；
- Linear、Embedding、RMSNorm、SwiGLU 和 RoPE；
- Scaled Dot-Product Attention、Causal Multi-Head Attention 和 Transformer LM；
- Cross Entropy、AdamW、Warmup/Cosine Schedule 和 Gradient Clipping；
- Data Loader、Checkpoint、训练循环和文本生成；
- 参数量、FLOPs、激活与优化器显存估算；
- TinyStories/OpenWebText 训练、调参和架构消融。

## 与推理工程的关系

这部分建立推理优化的坐标系。只有清楚 prefill/decode 中具体执行哪些模块、张量 shape 如何变化、计算和显存消耗来自哪里，才能理解 KV Cache、量化、算子融合和推理引擎调度。

## 完成检查表

- [ ] 能独立解释 byte-level BPE 的训练和编码过程
- [ ] 能从张量 shape 推导 attention 和 MLP 的计算量
- [ ] 能解释 RMSNorm、RoPE、SwiGLU 和 GQA/MQA 的设计动机
- [ ] 完成 Assignment 1 单元测试
- [ ] 在 TinyStories 上训练并生成可读文本
- [ ] 写出模型参数、训练显存和单步 FLOPs 的估算过程
