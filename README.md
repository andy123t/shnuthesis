# SHNU-Thesis

上海师范大学研究生毕业论文 LaTeX 模板

LaTeX template for graduation thesis of Shanghai Normal University

**注意：** 本模板推荐安装 **texlive** 发行版，并且需要 **XeLaTeX** 编译运行！

```tex
\documentclass[master,12pt]{shnuthesis}
```

shnuthesis 文档类可指定的选项包括
- master 硕士学位论文，默认可省略
- doctor 博士学位论文，不能省略
- print 用于打印，封面等生成空白页，可省略
- 提交给图书馆的电子版，不要选 print


本模板为非官方的研究生学位论文 LaTeX 模板，参考了《上海师范大学研究生学位论文规范》，文档类 (理科) 文件为 **shnuthesis.cls**，主文件 **example.tex** 展示了排版中常用的例子，包括公式、定理、表格、插图、参考文献等。

由于文科研究生毕业论文模板的章节等与理科有差别，可选用文档类 **shnuthesis-arts.cls**，之所以没有放在一起是因为文档类太复杂会影响编译速度。

本模板可以上传到在线 LaTeX 编辑网站 Overleaf 上使用。如果在线使用，需要自行设置字体 (fontset = ubuntu)，更推荐本地使用这个模板。

如有不足之处，欢迎提出意见或建议。
