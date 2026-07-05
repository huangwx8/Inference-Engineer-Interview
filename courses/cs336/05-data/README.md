# 05 Data

## 学习目标

理解原始网页如何变成可训练数据，以及抽取、过滤、去重和数据混合如何影响最终模型能力。

## 对应课程

| Lecture | 主题 |
| --- | --- |
| 12 | Evaluation |
| 13 | Data Sources and Datasets |
| 14 | Filtering, Deduplication, Mixing and Synthetic Data |

## 课程资源

- [课程视频 Playlist](https://www.youtube.com/playlist?list=PLoROMvodv4rMqXOcazWaTUHhq-yembLCV)
- [Lecture 12 在线讲义: Evaluation](https://cs336.stanford.edu/lectures/?trace=lecture_12)
- [Lecture 13 在线讲义: Data Sources and Datasets](https://cs336.stanford.edu/lectures/?trace=lecture_13)
- [Lecture 14 在线讲义: Filtering and Deduplication](https://cs336.stanford.edu/lectures/?trace=lecture_14)
- [Assignment 4 Handout](resources/assignment-4-data.pdf)
- [Assignment 4 官方仓库](https://github.com/stanford-cs336/assignment4-data)

## Assignment

Assignment 4 要求构建 Common Crawl 数据流水线：

- 检查 WARC/WET 原始数据并完成 HTML-to-text；
- 语言识别、PII 脱敏和有害内容过滤；
- Gopher 风格质量规则与质量分类器；
- Exact line deduplication；
- MinHash + LSH 文档级近似去重；
- 过滤、Tokenize 并训练模型；
- 比较不同数据处理策略对验证结果的影响。

## 与推理工程的关系

纯推理系统岗位可选择性完成。若目标包含训练 Infra、Agent 数据闭环、模型评测或效果归因，这部分会非常重要，因为线上模型问题经常最终回到数据分布和评测集质量。

## 完成检查表

- [ ] 能解释 WARC、WAT 和 WET 的区别
- [ ] 能说明语言、质量、安全和 PII 过滤的误伤风险
- [ ] 能解释 MinHash + LSH 的近似去重流程
- [ ] 能设计过滤前后的数据质量抽样
- [ ] 能用模型结果验证数据处理策略，而不只统计保留率
