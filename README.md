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

本地测试环境：Windows 10 安装 texlive 发行版。如果使用某个 texlive 版本 (比如 texlive 2021)，中文字体不是 Windows 默认字体，可设置

```tex
\documentclass[fontset=windows]{shnuthesis}
```

在线 LaTeX 编辑可以使用 [TeXPage](https://www.texpage.com/)，设置字体 (`fontset=windows`)，使用 XeLaTeX 编译，格式符合学校要求，推荐使用。

TeXPage 模板库中已上传本模板的最新版本，可通过以下链接直接使用：[SHNUThesis](https://www.texpage.com/zh/template/f3ca408e-5aaa-4db8-ab3f-1c9d01380eb7)。

如果在线使用 [Overleaf](https://www.overleaf.com/)，设置字体 (`fontset=ubuntu`) 后可运行，但字体不符合学校要求，不推荐使用。

如有不足之处，欢迎提出意见或建议。
