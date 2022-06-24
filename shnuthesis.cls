%%
%%	This is file `shnuthesis.cls',
%%
%%	@author andy123t
%%	@date 2022/06/24
%%	@version v3.0
%%	@address https://github.com/andy123t/shnuthesis
%%	LaTeX thesis template for Shanghai Normal University
%%

% ---------- 定义的新的Class ----------
\ProvidesClass{shnuthesis}[2022/06/24 v3.0]
\NeedsTeXFormat{LaTeX2e}

% ---------- 载入学校logo ----------
\def\logopic{shnu.eps}   %SHNU-logo

% ---------- 定义的新的Options ----------
\newif\ifshnu@master
\newif\ifshnu@print
\newif\ifshnu@science
\newif\ifshnu@arts
\DeclareOption{master}{\shnu@mastertrue}
\DeclareOption{doctor}{\shnu@masterfalse}
\DeclareOption{print}{\shnu@printtrue}
\DeclareOption{science}{\shnu@sciencetrue}
\DeclareOption{arts}{\shnu@artstrue}
\DeclareOption{openany}{\PassOptionsToClass{openany}{ctexbook}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{ctexbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{master,science,openany,twoside}
\ProcessOptions\relax

% ---------------------------------
% twoside,openany 单面排版
% twoside,openany,print 用于打印, 封面等生成空白页
% twoside,openright,print 用于打印, 全部双面排版
% ---------------------------------

% ---------- 修改字体宏包 ----------
\PassOptionsToPackage{no-math}{fontspec}

% ---------- 载入Class ----------
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}[2017/04/01]%
\@ifclasslater{ctexbook}{2017/01/01}{}{%
    \ClassError{shnuthesis}{ctex >= 2017/01/01 is required ...}{}%
}

% ---------- 定义页边距 ----------
\RequirePackage{geometry}
%\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=3.0cm}
\geometry{left=3.0cm,right=3.0cm,top=3.0cm,bottom=3.2cm}
\setlength{\headheight}{18pt}
\setlength{\headsep}{18pt}     % 页眉位置
\setlength{\footskip}{28pt}    % 页脚位置

% ---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm,amsfonts}  % AMS公式
\RequirePackage{bm}         % 数学公式黑斜体
\RequirePackage{mathrsfs}   % 数学英文花体
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{longtable}  % 长表格
\RequirePackage{multirow}   % 表格多行合并
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{makecell}
\RequirePackage{etoolbox}
\RequirePackage{titletoc}

% ----- 定义文档属性格式 -----
\def\shnu@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname shnu@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}

% ------ 添加几个新的文档属性 ------
\shnu@define@term{college}
\shnu@define@term{major}
\shnu@define@term{study}
\shnu@define@term{stunum}
\shnu@define@term{instructor}
%\shnu@define@term{clc}

% ----- 定义新变量 -----
\newcommand\shnuname{上海师范大学}
\newcommand\cnabstractbame{摘~~要}
\newcommand\enabstractbame{Abstract}
\newcommand\symbolpagename{主要符号表}
\newcommand\thankpagename{致谢}

\ifshnu@master
  \newcommand\shnu@thesisname{硕~士~学~位~论~文}%
  \newcommand\shnu@shnuthesisname{上海师范大学硕士学位论文}%
  \newcommand\shnu@researchname{攻读硕士学位期间的研究成果}%
  \else
  \newcommand\shnu@thesisname{博~士~学~位~论~文}%
  \newcommand\shnu@shnuthesisname{上海师范大学博士学位论文}%
  \newcommand\shnu@researchname{攻读博士学位期间的研究成果}%
\fi

% ------- 重新定义cleardoublepage --------
\renewcommand{\cleardoublepage}{\clearpage
    \clearpage\if@twoside\ifodd\c@page\else%
    \thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

% ----- 设置超链接 -----
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor = black,
	citecolor = blue,
	filecolor = blue,
    urlcolor =blue,
}

% ----- 设置正文页码为阿拉伯数字 -----
\renewcommand\mainmatter{%
  \cleardoublepage
  \pagenumbering{arabic}%
  \@mainmattertrue
}

% -------- 设置图片的路径 ---------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

% ---------- 定义章节的编号格式 ----------
\newcommand{\chpzihao}{\fontsize{20pt}{20pt}\selectfont}

% ---------- 设置章节目录的深度 -------------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% ---------- 定义章节标题格式 ------------
% ---------- 理科论文章节格式 ----------
\ifshnu@science
%--- chapter ---
\ctexset{
    chapter = {
        format = \linespread{1.0}\heiti\chpzihao\centering,
        nameformat = {},
        titleformat = {},
        number = \arabic{chapter},
        numberformat = {},
        aftername = \quad,
        beforeskip = {4pt},
        afterskip = {24pt},
        pagestyle = plain,
    }
}
%--- section ---
\ctexset{
    section = {
        format = \linespread{1.0}\heiti\zihao{-3}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
%--- subsection ---
\ctexset{
    subsection = {
        format = \linespread{1.0}\heiti\zihao{4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- subsubsection ---
\ctexset{
    subsubsection = {
        format = \linespread{1.0}\heiti\zihao{-4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- appendix ---
\ctexset{
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    }
}
\fi

% ---------- 文科论文章节格式 ----------
\ifshnu@arts
%--- chapter ---
\ctexset{
    chapter = {
        format = \linespread{1.0}\heiti\chpzihao\centering,
        nameformat = {},
        titleformat = {},
        number = \chinese{chapter},
        numberformat = \heiti,
        aftername = \quad,
        beforeskip = {4pt},
        afterskip = {24pt},
        pagestyle = plain,
    }
}
%--- section ---
\ctexset{
    section = {
        format = \linespread{1.0}\heiti\zihao{-3}\centering,
        name = {第,节},
        number = \chinese{section},
        numberformat = \heiti,
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
%--- subsection ---
\ctexset{
    subsection = {
        format = \linespread{1.0}\heiti\zihao{4}\raggedright,
        number = \chinese{subsection},
        numberformat = \heiti,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- subsubsection ---
\ctexset{
    subsubsection = {
        format = \linespread{1.0}\heiti\zihao{-4}\raggedright,
        name = {（,）},
        number = \chinese{subsubsection},
        numberformat = \bfseries,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- appendix ---
\ctexset{
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    }
}
\fi

% ---------- 算法宏包及设置 ----------
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\floatname{algorithm}{算法}
\algrenewcommand\algorithmicrequire{\textbf{输入:}}
\algrenewcommand\algorithmicensure{\textbf{输出:}}

% -------------- 定义页眉页脚 -------------------
% 定义页眉和页脚 使用 fancyhdr 宏包

% ------------ 设置分隔线宽度 ------------
\renewcommand{\headrulewidth}{0.4pt}    % 在页眉下0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。

% ------------ 设置页眉样式 ------------
\renewcommand{\headrule}{%
	\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
	\hrule\@height 1.5pt \@width\headwidth %上面线1pt粗
	\vskip 1.6pt %两条线的距离1pt
	\hrule\@height 0.4pt \@width\headwidth %下面线0.4pt粗
    \vskip-1.5pt
}

% \renewcommand{\headrule}{%
% 	\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
% 	\hrule\@height 0.5pt \@width\headwidth %上面线1pt粗
%     \vskip-1.5pt
% }

% ------------ 设置页眉样式 -----------
\newcommand{\headstyle}{
\fancyhead[RO,LE]{\zihao{5} \nouppercase{\leftmark}}
\fancyhead[LO,RE]{\zihao{5} \shnu@shnuthesisname}
%\fancyhead[C]{\zihao{5} \nouppercase{\leftmark}}
}

% ------- 设置页脚样式 ----------
\newcommand{\footstyle}{
\fancyfoot[C]{\zihao{5} \thepage}
%\fancyfoot[LE]{\zihao{5} \thepage}
%\fancyfoot[RO]{\zihao{5} \thepage}
}

\pagestyle{empty}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle

% --------- 定义一种新的格式叫做main ---------
\fancypagestyle{main}{%
  \pagestyle{fancyplain}
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}

% ----------- 中文段落缩进和行距 ------------
\setlength{\parindent}{2em}                 % 首行两个汉字的缩进量
\setlength{\parskip}{4pt plus 1pt minus 1pt}  % 段落之间的竖直距离
\linespread{1.35}  % 设置行距
%\renewcommand{\baselinestretch}{1.35}  % 设置行距
%\topskip=15pt   % 书写区域顶部空白
%\setlength{\baselineskip}{24pt}

% ------------------- 浮动对象设置 ---------------------
% 浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面
% 也可以防止在很大空白的浮动页上放置很小的图形
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% ---------------- 设置图表格式 ---------------
\numberwithin{figure}{chapter}
\numberwithin{equation}{chapter}
%\renewcommand{\thetable}{\thechapter.\arabic{table}}
%\renewcommand{\thefigure}{\thechapter.\arabic{figure}}

% --------- 定制图形和表格标题的样式 --------------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={5pt},name={图}}
\captionsetup[table]{position=top,skip={2pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
\setlength{\abovecaptionskip}{2pt plus 1pt minus 1pt}
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}
%\setlength{\itemsep}{3pt plus 1pt minus 2pt}

% -------- 重新设置图表autoref ---------
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}

% ------ 使用tabularx库并定义新的左右中格式 ------
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

% ------------ 设置三线表格式 ----------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}

%------------- 数学定理设置 ---------------
\theoremstyle{plain}
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{remark}{注}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{property}{性质}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
%\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@addpunct{\,:\,}]\ignorespaces
}{%
	\popQED\endtrivlist\@endpefalse
}

% -------------- 数学公式设置 ---------------
\allowdisplaybreaks[4]   % 部分公式可以分页

% ----- 设置公式间距 ------
\AtBeginDocument{
	\setlength{\abovedisplayskip}{5pt plus 2pt minus 2pt}
	\setlength{\belowdisplayskip}{5pt plus 2pt minus 2pt}
	\setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
	\setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
	%\setlength{\arraycolsep}{2pt}   % array中列之间空白长度
}

% ------- 公式编号带章节 ----------
\numberwithin{equation}{chapter}
%\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% 重新设置公式autoref
\renewcommand{\equationautorefname}{公式}

% --------- 定义列表项的样式 ---------
\RequirePackage{enumitem}
\setlist{nolistsep}

% ------------- 定义新的标题页面 -------------------

% ------- 重置命令maketitle -------
\renewcommand{\maketitle}[1][15em]{
	\clearpage
	\phantomsection
	\pdfbookmark[0]{封~~面}{cover}
	\thispagestyle{empty}
	\begin{center}
		\vspace*{-1.9\baselineskip}

        {\hfill 学校代码：10270 \hspace*{8cm} 学号：\shnu@stunum \hfill}

		\vspace*{4.0\baselineskip}

		\includegraphics[width=10cm]{\logopic}

		\vspace*{1.0\baselineskip}

		{\fontsize{40}{40}\selectfont \shnu@thesisname}

		\vspace*{2.5\baselineskip}

		\parbox[t]{15cm}{\centering \zihao{1} \heiti \@title}

		\vspace*{3.0\baselineskip}

		{\zihao{3} \heiti
			\renewcommand\arraystretch{1.6}
			\begin{tabular}{lc}
				\makebox[7em][s]{学 \hfill 院~：} & \underline{\makebox[#1]{\shnu@college}} \\
				\makebox[7em][s]{专 \hfill 业~：} & \underline{\makebox[#1]{\shnu@major}} \\
				\makebox[7em][s]{研 \hfill 究 \hfill 方 \hfill 向~：} & \underline{\makebox[#1]{\shnu@study}} \\
				\makebox[7em][s]{研 \hfill 究 \hfill 生 \hfill 姓 \hfill 名~：} & \underline{\makebox[#1]{\@author}} \\
				\makebox[7em][s]{指 \hfill 导 \hfill 教 \hfill 师~：} & \underline{\makebox[#1]{\shnu@instructor}} \\
				\makebox[7em][s]{完 \hfill 成 \hfill 日 \hfill 期~：} & \underline{\makebox[#1]{\@date}} \\
			\end{tabular}}
	\end{center}
	\clearpage
    \ifshnu@print
    	\cleardoublepage
    	\hypersetup{hidelinks} % remove link color and border
    \fi
}

% ----------- 定义声明页 ------------
\newcommand{\makestatement}{
	\clearpage
	\phantomsection
	\pdfbookmark[0]{声明页}{statement}
	\thispagestyle{empty}
	{
		\linespread{1.6}\selectfont

		\vspace*{0.1\baselineskip}

		\begin{center}
			{\heiti \chpzihao 论文独创性声明}
		\end{center}

		\vspace*{\baselineskip}

		本论文是我个人在导师指导下进行的研究工作及取得的研究成果。论文中除了特别加以标注和致谢的地方外，不包含其他人或机构已经发表或撰写过的研究成果。其他同志对本研究的启发和所做的贡献均己在论文中做了明确的声明并表示了谢意。

		\vspace*{2.4\baselineskip}

		\hspace*{1.5cm} \raisebox{5pt}{作者签名：} \hrulefill \hspace*{4em} \raisebox{5pt}{日\hspace*{2em}期：}\hrulefill \hspace*{0.5cm}

		\vspace*{4\baselineskip}

		\begin{center}
			{\heiti \chpzihao 论文使用授权声明}
		\end{center}

		\vspace*{\baselineskip}

		本人完全了解上海师范大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被査阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其它手段保存论文。

		\vspace*{0.25\baselineskip}

		{\bfseries （保密的论文在解密后应遵守此规定）}

		\vspace*{2.4\baselineskip}

		\hspace*{1.5cm} \raisebox{5pt}{作者签名：} \hrulefill \hspace*{4em} \raisebox{5pt}{导师签名：} \hrulefill \hspace*{0.5cm}

		\vspace*{0.25\baselineskip}

		\hspace*{1.5cm} \raisebox{5pt}{日\hspace*{2em}期：} \hrulefill \hspace*{4em} \raisebox{5pt}{日\hspace*{2em}期：} \hrulefill \hspace*{0.5cm}

		\vspace*{1.8\baselineskip}
	}
	\clearpage
    \ifshnu@print
        \cleardoublepage
    \fi
}

% ---------- 定义插入声明页 pdf 文件命令 ----------
\newcommand{\insertstatement}[1]{
	\clearpage
	\phantomsection
	\pdfbookmark[0]{声明页}{statement}
	\thispagestyle{empty}
	\includepdf{#1}
	\clearpage
    \ifshnu@print
        \cleardoublepage
    \fi
}

% ----------------- 定义中英文关键词 ----------------
%--- 中文关键词 ---
\newcommand{\cnkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries 关键词:~} #1}
%--- 英文关键词 ---
\newcommand{\enkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries Key Words:~} #1}

% ------------------ 中文摘要环境 -------------
\newenvironment{cnabstract}{
	\clearpage
	\pagestyle{main}
	\phantomsection
	\addcontentsline{toc}{chapter}{\cnabstractbame}
	\chapter*{\cnabstractbame}
	\chaptermark{\cnabstractbame}
}{
	\clearpage
    \if@openright
        \cleardoublepage
    \fi
}

% ----------------- 英文摘要环境 ----------------
\newenvironment{enabstract}{
	\clearpage
	\pagestyle{main}
	\phantomsection
	\addcontentsline{toc}{chapter}{\enabstractbame}
	\chapter*{\bfseries\enabstractbame}
	\chaptermark{\enabstractbame}
}{
	\clearpage
	\ifshnu@print
        \cleardoublepage
    \fi
    \if@openright
        \cleardoublepage
    \fi
}

% ------------- 定义新的目录页面 ----------------
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\listfigurename}{插图清单}
\renewcommand{\listtablename}{表格清单}
\setlength{\cftbeforetoctitleskip}{8pt}
\setlength{\cftaftertoctitleskip}{20pt}
\setlength{\cftbeforechapskip}{12pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{3}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand\cftchapleader{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}

% ----------- 设置新的生成目录命令 -------------
\newcommand{\maketoc}{
	% 设置目录hdr和页码选项
	\clearpage
	\pagestyle{main}
	\phantomsection
	\addcontentsline{toc}{chapter}{\contentsname}
	\tableofcontents
	\clearpage
    \ifshnu@print
        \cleardoublepage
    \fi
}

% ----------- 设置插图清单和表格清单格式 ----------
\titlecontents{figure}[0pt]{}{
\figureautorefname\hspace*{0.5em}\thecontentslabel\quad}{}{
\titlerule*[8pt]{$\cdot$}\contentspage}
\titlecontents{table}[0pt]{}{
\tableautorefname\hspace*{0.5em}\thecontentslabel\quad}{}{
\titlerule*[8pt]{$\cdot$}\contentspage}

% ----------- 重定义插图清单 ----------
\newcommand\makelof{
    \clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\listfigurename}
    \chapter*{\listfigurename}
    \@starttoc{lof}
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

% ----------- 重定义表格清单 ----------
\newcommand\makelot{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}
    \chapter*{\listtablename}
    \@starttoc{lot}
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

% ---------- 定义主要符号表环境 -----------
\newenvironment{symbolpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\symbolpagename}
	\chapter*{\symbolpagename}
	\chaptermark{\symbolpagename}
}{
	\clearpage
	\ifshnu@print
        \cleardoublepage
    \fi
}

% ---------- 定义新的致谢环境 -----------
\newenvironment{thankpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\thankpagename}
	\chapter*{\thankpagename}
	\chaptermark{\thankpagename}
	\baselineskip=1.2\baselineskip
}{
	\clearpage
    \if@openright
        \cleardoublepage
    \fi
}

% ----------- 重新定义参考文献页 -----------
\RequirePackage[sort&compress]{natbib}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
%--- 参考文献引用 ---
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
\if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\renewcommand\NAT@citenum%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}{}{}
\renewcommand\NAT@cite[3]{
\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
#1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi
\endgroup}
%--- 参考文献间距 ---
\def\bibfont{\small}
\setlength{\bibsep}{8pt}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
  \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
  \do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J%
  \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T%
  \do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0%
}
%--- 设置新的参考文献命令 ---
\renewcommand{\bibname}{参考文献}
\renewcommand\bibsection{%
    \@mainmatterfalse
    \chapter{\bibname}%
    \@mainmattertrue
}

% ---------- 定义新的环境研究成果页 -----------
\newenvironment{researchpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\shnu@researchname}
	\chapter*{\shnu@researchname}
	\chaptermark{\shnu@researchname}
	\baselineskip=1.2\baselineskip
}{
	\clearpage
    \if@openright
        \cleardoublepage
    \fi
}

% End of file `shnuthesis.cls'.
