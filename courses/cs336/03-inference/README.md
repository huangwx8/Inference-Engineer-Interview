# 03 Inference

## 学习目标

把模型和系统知识转向在线推理：理解首 Token 延迟、逐 Token 延迟、吞吐、KV Cache、batching 和资源利用率之间的关系。

## 对应课程

| Lecture | 主题 |
| --- | --- |
| 10 | Inference |

## 课程资源

- [课程视频 Playlist](https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV)
- [Lecture 10 在线讲义: Inference](https://cs336.stanford.edu/lectures/?trace=lecture_10)
- [Lecture 10 源材料](https://github.com/stanford-cs336/lectures/blob/main/lecture_10.py)

Lecture 10 是 executable lecture，官方没有单独 PDF，因此本节只保存在线资源。

## Assignment

课程没有为 Inference 单独设置 assignment。建议基于 Assignment 1 模型自行完成以下练习：

- 分别测量 prefill 和 decode 的延迟与算术强度；
- 推导不同 batch、sequence length 和 KV Cache dtype 的显存；
- 实现基础 KV Cache，并和无缓存 decode 对比；
- 比较静态 batching 与 continuous batching 的调度行为；
- 用 TTFT、TPOT、tokens/s 和 P99 组织 benchmark；
- 阅读 vLLM 或 SGLang 的请求调度与 KV Cache 管理流程。

## 与推理工程的关系

这是课程内容与目标岗位之间最关键的桥梁。Assignment 1 告诉你模型算什么，Assignment 2 告诉你 GPU 怎样执行；本节需要把两者组合为真实请求下的延迟、吞吐、显存和成本决策。

## 完成检查表

- [ ] 能解释 prefill 与 decode 的性能差异
- [ ] 能推导 KV Cache 显存公式
- [ ] 能解释 TTFT、TPOT、吞吐和尾延迟
- [ ] 能说明 batch 增大为何提高吞吐却可能恶化延迟
- [ ] 能画出推理请求从队列到 GPU 再到流式返回的数据流
- [ ] 能给出一个可复现的推理 benchmark 设计
