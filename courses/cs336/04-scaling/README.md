# 04 Scaling

## 学习目标

理解如何用小规模实验预测大规模训练结果，并在固定计算预算下选择模型大小、训练 Token 数和关键超参数。

## 对应课程

| Lecture | 主题 |
| --- | --- |
| 9 | Scaling Laws Basics |
| 11 | Scaling Laws |

## 课程资源

- [课程视频 Playlist](https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV)
- [Lecture 9: Scaling Laws Basics](resources/lecture-09-scaling-laws-basics.pdf)
- [Lecture 11: Scaling Laws](resources/lecture-11-scaling-laws.pdf)
- [Assignment 3 Handout](resources/assignment-3-scaling.pdf)
- [Assignment 3 官方仓库](https://github.com/stanford-cs336/assignment3-scaling)

## Assignment

Assignment 3 包含：

- 用合成数据复现 Chinchilla IsoFLOPs 方法；
- 拟合模型规模、Token 数和计算预算之间的幂律；
- 在有限 B200 实验预算下规划训练 API 查询；
- 预测更大预算下的 compute-optimal 模型；
- 选择层数、hidden size、head、学习率和训练 Token 数；
- 用可复现报告解释实验选择与不确定性。

## 与推理工程的关系

Scaling Law 主要服务训练决策，但它培养的实验预算意识同样适用于推理优化：先在小模型、小流量和有限 shape 上建立趋势，再判断优化是否能扩展到目标模型和生产负载。

## 完成检查表

- [ ] 能解释参数量、Token 数和训练 FLOPs 的关系
- [ ] 能构造并解释 IsoFLOPs 曲线
- [ ] 能说明外推为什么存在风险
- [ ] 能在固定预算下设计最有信息量的一组实验
- [ ] 完成 Assignment 3 的拟合代码和结果报告
