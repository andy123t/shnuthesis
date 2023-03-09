# SHNU-Thesis

上海师范大学研究生毕业论文 LaTeX 模板

LaTeX Thesis Template for Shanghai Normal University

**注意：** 本模板推荐安装 **texlive** 发行版，并且需要 **XeLaTeX** 编译运行！

```tex
\documentclass[master]{shnuthesis}
```

shnuthesis 文档类可指定的选项包括
- master 硕士学位论文, 默认可省略
- doctor 博士学位论文, 不能省略
- arts 文科学位论文, 默认缺省为理科
- print 用于打印, 封面等生成空白页
- 提交给图书馆的电子版, 不要选 print

本模板为上海师范大学非官方的研究生学位论文 LaTeX 模板，参考了《上海师范大学研究生学位论文规范》，文档类为 **shnuthesis.cls**，示例文件 **example.tex** 给出了使用的指南和要求，也展示了论文排版中常用的例子，包括公式、定理、表格、插图、参考文献等。

本地测试环境：Windows 10 安装 texlive 2020 发行版。

在线 LaTeX 编辑可以使用 [TeXPage](https://www.texpage.com/)，选 texlive 2021 版本，设置字体 (`fontset=windows`)，格式符合学校要求，推荐使用。

如果在线使用 [Overleaf](https://www.overleaf.com/)，设置字体 (`fontset=ubuntu`) 后可运行，但字体不符合学校要求，不推荐使用。

如有不足之处，欢迎提出意见或建议。
