%
%	shnuthesis.cls
%	本文件是上海师范大学研究生毕业论文模板类文件
%	@author andy123t
% 	@date 2020/06/02
%	@version v1.0.0
%   参考：https://github.com/skinaze/HUSTPaperTemp

% ---------- 定义的新的类 ----------
\ProvidesClass{shnuthesis2}[2020/06/02 v1.0.0]
\NeedsTeXFormat{LaTeX2e}



% ---------- 定义类的选项 ----------
\def\logopic{shnu.eps}   %logo
\DeclareOption{SHNULogo} {
	\def\logopic{shnu.eps}
}
\ProcessOptions\relax



% ---------- 载入Class ----------
\LoadClass[a4paper,openany]{book}
%页面基本设置
\RequirePackage[boldfont,slantfont]{xeCJK}
\RequirePackage[cs4size,UTF8,winfonts,heading=true]{ctex}

% ---------- 定义字体 ----------
% \RequirePackage{xeCJK}
%用于设置非常用字体
\RequirePackage{fontspec}
%论文封面使用宋体和仿宋
%\setmainfont{Microsoft YaHei}
%\setmainfont{Times New Roman} 


% ---------- 定义页边距 ----------
%
\RequirePackage{geometry}
\geometry{left=2.5cm,right=2.5cm,top=1.7cm,bottom=1.8cm,includehead,includefoot}
\geometry{headsep=1em,footskip=2em}
% \geometry{headheight=14pt}
% \geometry{headsep=-0.1cm,footskip=-0.1cm}
% \geometry{headheight=14pt}

%  ---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm}  % AMSLaTeX宏包 用来排出更加漂亮的公式
\RequirePackage{bm}    % 处理数学公式中的黑斜体的宏包
\RequirePackage{mathrsfs}  % 不同于\mathcal or \mathfrak 之类的英文花体字体
\RequirePackage{graphicx} % 添加图需要的库
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{cite}
\RequirePackage{longtable}   % 长表格
\RequirePackage{multirow}   % 表格多行合并, 矩阵的边注
\RequirePackage{colortbl}   % 彩色表格
% %\RequirePackage{dcolumn}    % 让表格中将小数点对齐
\RequirePackage{enumerate}      % 改变列表标号样式
%\RequirePackage{epsfig}
%\RequirePackage{epstopdf}
%\RequirePackage{subfigure}
\RequirePackage{color,xcolor}
\RequirePackage{setspace}
\RequirePackage{tikz}  % 用于绘制图形
%\RequirePackage{pifont}         % 有很漂亮的带圈的各种数字符号使用
%\RequirePackage{layouts}
%\usepackage[perpage,symbol]{footmisc}   % 脚注控制
%\RequirePackage{fancyref}
%\RequirePackage{lastpage}                   % 自动记录总页数宏包，计数器为 LastPage

% 使用Times字体的宏包
%\RequirePackage{times}
%\RequirePackage[perpage,symbol]{footmisc}   % 脚注控制


% \setmainfont{Times New Roman}

\RequirePackage[T1]{fontenc}


% ------ 设置电脑中有的字体 --------
% \RequirePackage{fontspec}
% \setmainfont[BoldFont=Nimbus Sans L,ItalicFont={Nimbus Roman No9 L}]{Times New Roman}


% --------设置图片的路径 ---------
%\graphicspath{{./Figures/}}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./pictures/}{./picture/}}


% ----------  ----------


%%%%%%%%%%%%%%%%%%%% 定义标题和段落样式 %%%%%%%%%%%%%%%%%%%%%%%%

%设置各个标题样式
%不需要使用part和chapter层级
\RequirePackage{titlesec}

%\ctexset{chapter={format={\centering \heiti \bfseries \zihao{2}},titleformat=\raggedright,name={第,章}}}
%\newcommand{\chapterbreak}{\clearpage} %小节从新的一页开始
%\ctexset{chapter={format={\centering \heiti \bfseries \zihao{3}},titleformat=\raggedright,name={第,章}}}
% \ctexset{chapter={format={\centering \heiti \bfseries \zihao{-2}}}}
%\ctexset{chapter={format={\heiti\zihao{3}}}}
% \newcommand{\chapterbreak}{\clearpage} %小节从新的一页开始
% \ctexset{section={format={\centering \heiti \bfseries \zihao{-4}}}} %节
% \ctexset{subsection={format={\raggedright \heiti \bfseries \zihao{5}}}} %小节
% %\ctexset{subsubsection={format={\raggedright \heiti \bfseries \zihao{-4}}}} %小小节
% \ctexset{paragraph={beforeskip={0em}}}
% \ctexset{subparagraph={beforeskip={0em}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 定制章节的标题样式 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------- 设置章节目录的深度 --------------------------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3} 

%---------------------- 定义章节的编号格式 --------------------------
\renewcommand{\chaptername}{第\chinese{chapter}章}
%\renewcommand{\chaptername}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}.}
% \let\oldtitle=\title
% \def\title#1{\oldtitle{\cnbf{#1}}}


%----------------------- 定义章节标题格式 ----------------------------
% \titleformat{\chapter}[hang]{\normalfont\huge\filcenter\heiti}
%     {\huge{\chaptertitlename}}{20pt}{\huge}
% \titlespacing{\chapter}{0pt}{-3ex  plus .1ex minus .2ex}{2.5ex plus .1ex minus .2ex}

\titleformat{\chapter}[hang]{\normalfont \Large \filcenter\heiti}
    {\Large {\chaptertitlename}}{20pt}{\Large}
\titlespacing{\chapter}{0pt}{0ex  plus .1ex minus .2ex}{3ex plus .1ex minus .2ex}

%\titleformat{\section}[hang]{\CJKfamily{hei}\Large \centering} %标题居中
\titleformat{\section}[hang]{\heiti \large}
    {\large \thesection}{1em}{}{}
\titlespacing{\section}{0pt}{3ex plus .1ex minus .2ex}{1.5ex plus .1ex minus .2ex}%{\wordsep}

\titleformat{\subsection}[hang]{\heiti\normalsize}
    {\normalsize \thesubsection}{1em}{}{}
\titlespacing{\subsection}%
    {0pt}{1.5ex plus .1ex minus .2ex}{\wordsep}

\titleformat{\subsubsection}[hang]{\CJKfamily{hei}}
    {\thesubsubsection }{1em}{}{}
\titlespacing{\subsubsection}%
    {0pt}{1.2ex plus .1ex minus .2ex}{\wordsep}




% ----------- 设置附录 ---------
\RequirePackage{titletoc}
\RequirePackage[title,titletoc]{appendix}
\renewcommand{\appendixname}{附录}

%首行缩进存在问题，暂不使用
% \iffalse
% %设置新的标题层级subsubsubsection
% \titleclass{\subsubsubsection}{straight}[\subsection]
% %设置编号
% \newcounter{subsubsubsection}[subsubsection]
% \renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
% %设置标题样式
% \titleformat{\subsubsubsection}
% {\raggedright \heiti \bfseries \zihao{-4}}{\thesubsubsubsection}{1em}{}[]
% \titlespacing*{\subsubsubsection}
% {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
% %重新设置段落等级
% \def\toclevel@subsubsubsection{4}
% \def\toclevel@paragraph{5}
% \def\toclevel@paragraph{6}
% \def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
% \def\l@paragraph{\@dottedtocline{5}{10em}{5em}}
% \def\l@subparagraph{\@dottedtocline{6}{14em}{6em}}
% %设置目录深度
% \setcounter{secnumdepth}{3}
% \setcounter{tocdepth}{3}
% \fi



%%%%%%%%%%%%%%%%%%%%%%%% 定义页眉页脚 %%%%%%%%%%%%%%%%%%%%%%%%%

% ------ 使用fancyhdr库 ------
\RequirePackage{fancyhdr}

% 定义页眉和页脚 使用fancyhdr 宏包
\newcommand{\makeheadrule}{%
    \makebox[-3pt][l]{\rule[.7\baselineskip]{\headwidth}{0.4pt}}
    \rule[0.85\baselineskip]{\headwidth}{1.5pt}\vskip-.8\baselineskip}

\makeatletter
\renewcommand{\headrule}{%
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
     \makeheadrule}}

%如果需要画单隔线，则需要
%\iffalse%-------------------------------%
\renewcommand{\headrulewidth}{0.5pt}    % 在页眉下画一个0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。

% \pagestyle{fancyplain}
% \renewcommand{\chaptermark}[1]%
% {\markboth{\chaptername \ #1}{}}            % \chaptermark 去掉章节标题中的数字
% \renewcommand{\sectionmark}[1]%
% {\markright{\thesection \ #1}{}}            % \sectionmark 去掉章节标题中的数字

% ------------ 设置页眉样式 -----------
\newcommand{\headstyle}{
	\fancyhead[L]{\color{black} 上海师范大学硕士论文}
	% \fancyhead[L]{\fangsong \zihao{-4} 上海师范大学硕士论文}
	\fancyhead[R]{\color{black}\fangsong \leftmark}
}

% ------- 设置页脚样式 ----------
\newcommand{\footstyle}{\fancyfoot[C]{\fangsong \thepage}}
\pagestyle{empty}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle

% ------ 定义一种新的格式叫做main ------------
\fancypagestyle{main}{%
    \pagestyle{fancyplain} 
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 用于中文段落缩进和正文版式 %%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parindent}{2em}                 % 首行两个汉字的缩进量
\setlength{\parskip}{3pt plus1pt minus1pt}  % 段落之间的竖直距离
\renewcommand{\baselinestretch}{1.2}        % 定义行距

\topskip=15pt
%\parskip=5pt
%\parindent=0pt
%\baselineskip=5pt
%\setlength{\baselineskip}{24pt}



% %------------------------- 列表与图表距离设置 -----------------------%
% \setlength{\topsep}{3pt plus1pt minus2pt}           % 第一个item和前面版落间的距离
% \setlength{\partopsep}{3pt plus1pt minus2pt}        % 当在一个新页开始时加到
%                                                     % \topsep 的额外空间
% \setlength{\itemsep}{3pt plus1pt minus2pt}          % 连续items之间的距离.
% \setlength{\floatsep}{10pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
% \setlength{\abovecaptionskip}{2pt plus1pt minus1pt} % 图形中的图与标题之间的距离
% \setlength{\belowcaptionskip}{3pt plus1pt minus2pt} % 表格中的表与标题之间的距离


% % 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面，
% % 也可以防止在很大空白的浮动页上放置很小的图形。
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 设置图表格式 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------ 设置图表标题的计数方式 ---------
% \renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
% \renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}

\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}



% --------- 定制图形和表格标题的样式 --------------
\RequirePackage{caption}
\captionsetup{font={normalsize,singlespacing},labelformat={default},labelsep=period}
\captionsetup[figure]{position=bottom,skip={5pt},name={图}}
\captionsetup[table]{position=top,skip={2pt},name={表}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{10pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}
%\setlength{\abovecaptionskip}{20pt plus 3pt minus 2pt} % Chosen fairly arbitrarily

%---------------------- 定制图形和表格标题格式 -------------
% \RequirePackage{caption2}
% \renewcommand{\captionlabeldelim}{} %定义如  "图(表)2: 示例" 中的间隔符号,如 ":" , 这里定义为空
% \renewcommand{\captionlabelsep}{\hspace{1em}} % 定义图表编号与标题间的间隔距离
% \renewcommand{\captionlabelfont}{\small \heti \bf} %定义图表标签的字体
% \renewcommand{\captionfont}{\small \songti \rmfamily} %定义图表标题内容的字体
% \scriptsize \footnotesize \small \large \Large  %图形标签字体大小
%\captionsetup[figure]{labelfont={bf},labelformat={default},labelsep=period,name={图.}}



% ----- 重新设置图表autoref -------
\newcommand{\figureautorefname}{图}
\newcommand{\tableautorefname}{表}



% --- 使用tabularx库并定义新的左右中格式 ----

\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedright \arraybackslash}X}


% ------------ 设置三线表格式 ------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}



%%%%%%%%%%%% 重新定义图和表的浮动环境 %%%%%%%%%%%%%%%%%

\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 数学公式设置 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \setlength{\abovedisplayskip}{2pt plus1pt minus1pt}     %公式前的距离
% \setlength{\belowdisplayskip}{2pt plus1pt minus1pt}     %公式后面的距离
% \setlength{\arraycolsep}{2pt}   %在一个array中列之间的空白长度, 因为原来的太宽了

\allowdisplaybreaks[4]  % \eqnarray如果很长，影响分栏、换行和分页


%--------------------------数学定理设置---------------------------------%
% \theoremstyle{definition} \newtheorem{defn}{\heiti 定义~}[chapter]
% \theoremstyle{plain} \newtheorem{prop}{命题~}[section]
% \theoremstyle{plain} \newtheorem{theorem}{定理~}[chapter]
% \theoremstyle{plain} \newtheorem{example}{\heiti 例子~}[chapter]
% \theoremstyle{plain} \newtheorem{lemma}{引理~}[chapter]
% \theoremstyle{plain}\newtheorem{col}{\heiti 推论~}[chapter]
% %\theoremstyle{remark}\newtheorem{remark}{\heiti 注~}[chapter]
% %\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
% \theoremstyle{plain}\newtheorem{remark}{\heiti 注~}[chapter]%%%改动

\theoremstyle{plain} 
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{example}{例子}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{remark}{注}[chapter]

%\renewcommand{\proofname}{证明}
%\renewcommand{\qedsymbol}{$\blacksquare$}

%\newtheorem{algorithm}{算法}
%\newtheorem{axiom}{公理}
%\newtheorem{property}{性质}
%\newtheorem{assumption}{假设}




% ----- 设置公式间距为零 ------
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt}
}


% ----- 公式编号带章节
\numberwithin{equation}{chapter}


%重新设置公式autoref
\newcommand{\equationautorefname}{等式}


%	---	定义列表项的样式

\RequirePackage{enumitem}
%\setlist{noitemsep}
\setitemize{itemsep=2pt}


%%%%%%%%%%%%%%%%%%%%% 定义新的标题页面 %%%%%%%%%%%%%%%%%%%%%

\def \hspt {\hspace{6pt}}  % 定义一个间距

% ------ 添加几个新的文档属性 ------
\def \defschool {}
\def \defcollege {}
\def \defmajor {}
\def \defstudy {}
\def \defstunum {}
\def \definstructor {}
\newcommand{\school}[1]{\def \defschool {#1}}
\newcommand{\college}[1]{\def \defcollege {#1}}
\newcommand{\major}[1]{\def \defmajor {#1}}
\newcommand{\study}[1]{\def \defstudy {#1}}
\newcommand{\stunum}[1]{\def \defstunum {#1}}
\newcommand{\instructor}[1]{\def \definstructor {#1}}

% ------- 重置命令 maketitle -------
\renewcommand{\maketitle}[1][12cm]{
	\begin{titlepage}
		\begin{center} %\zihao{4}
			{\zihao{5} 学校代码：10270  \hspace{2cm} 分类号：O24 \hspace{2cm} 学号：\defstunum} \\
			\vspace{2cm}
			\includegraphics[width=10cm]{\logopic}\\
			\vspace{1.5cm}
			{ \songti \bf \zihao{0} 硕 \hspt 士 \hspt 学 \hspt 位 \hspt 论 \hspt 文}\\ %\bfseries
			\vspace{2cm}
			%\vspace{6em}
			%{\zihao{2} \heiti \@title}\\
			\begin{center}
			\parbox[t]{15cm}{\centering \zihao{1} \heiti \@title}
			\end{center}
			%{\zihao{2} \heiti \@title} \\
			\vspace{2cm}
			{\zihao{3} \fangsong
				\renewcommand\arraystretch{1.6}
				\begin{tabular}{p{0cm}p{6em}l@{\extracolsep{1em}}l}
					%~&论\hfill 文\hfill 题\hfill 目   && {\heiti \@title}\\
					~&院\hfill 系 &&  {\heiti \defcollege}\\
					~&专\hfill 业 &&  {\heiti \defmajor} \\
					~&研\hfill 究\hfill 方\hfill 向  && {\heiti \defstudy} \\
					~&研\hfill 究\hfill 生\hfill 姓\hfill 名 &&  {\heiti \@author} \\
					%~&学 \hfill 号 &&  \defstunum \\
					~&指\hfill 导\hfill 教\hfill 师   && {\heiti \definstructor}\\
					~&完\hfill 成\hfill 日\hfill 期   && {\heiti \@date}\\
			\end{tabular}}\\
			% \vspace{4em}
			% {\zihao{3} \fangsong \@date}\\
		\end{center}
	\end{titlepage}
}



%%%%%%%%%%%%%%%%%% 定义新的声明页面 %%%%%%%%%%%%%%%%%%%%

% ----- 使用条件语句 ------
\RequirePackage{xstring}

% ------ 定义三个条件语句 -------
\newcommand{\encryption}[1]{
	\IfStrEqCase{#1}{{empty}{$\square$}
		{true}{$\text{\rlap{\checkmark}}\square$ }
		{false}{$\square$}}
	[$\square$]
}
\newcommand{\nonencryption}[1]{
	\IfStrEqCase{#1}{{empty}{$\square$}
		{true}{$\square$}
		{false}{$\text{\rlap{\checkmark}}\square$}}
	[$\square$]
}
\newcommand{\encryptionyear}[2]{
	\IfStrEqCase{#1}{{empty}{}
		{true}{#2}
		{false}{}}
}

% ----  设置命令
\newcommand{\makestatement}[2][0]{
	\clearpage
	\thispagestyle{empty}
	\vspace*{8ex}
	\begin{center}
		\heiti \zihao{2}
		论文独创性声明
	\end{center}
	\vspace*{10ex}
	\begin{spacing}{2.0}
	本论文是我个人在导师指导下进行的研究工作及取得的研究成果。论文中除了特別加以标注和致谢的地方外，不包含其他人或机构已经发表或撰写过的研究成果。其他同志对木研究的启发和所做的贡献均已在论文中做了明确的声明并表示了谢意。
	\end{spacing}
	% \rightline{作者签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	\vspace{4ex}
	 \parbox[t][10cm][c]{\textwidth}{\fontsize{13pt}{20pt}\selectfont \hspace{2cm}
     作者签名：\hrulefill \hfill 日\hspace{2em}期：\hrulefill \hspace{1cm} }
	\clearpage
	\thispagestyle{empty}
	\vspace*{8ex}
	\begin{center}
		\heiti \zihao{2}
		论文使用授权声明
	\end{center}
	\vspace*{10ex}
	\begin{spacing}{2.0}
	本人完全了解上海师范大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被査阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其它手段保存论文。保密的论文在解密后遵守此规定。
	\end{spacing}
	\vspace*{2ex}
	{\heiti（保密的论文在解密后应遵守此规定）}
	% \begin{tabbing}
	% 	\hspace{2em}本学位论文属于 \= 1、保密\hspace{1em} \=\encryption{#2}
	% 	，在\makebox[2em][c]{\encryptionyear{#2}{#1}}年解密后适用本授权书。\\
	% 	\>2、不保密\>\nonencryption{#2}
	% 	。\\
	% 	\>（请在以上相应方框内打“$\checkmark$”）
	% \end{tabbing}
	% \rightline{作者签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	% \rightline{导师签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	\vspace*{0ex}

	\parbox[t][10cm][c]{\textwidth}{\fontsize{13pt}{20pt}\selectfont \hspace{2cm}
    作者签名：\hrulefill \hfill 导师签名：\hrulefill \hspace{1cm}
    \\ \hspace*{2cm} 日\hspace{2em}期：\hrulefill \hfill
    日\hspace{2em}期：\hrulefill \hspace{1cm} }

	\clearpage
}




%%%%%%%%%%%%%%%%%% 定义新的中英文摘要环境 %%%%%%%%%%%%%%%%%%%

% ------------------ 中文摘要环境 -------------
\newenvironment{cnabstract}[1]{
	\def \cnkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{摘要}
	\chaptermark{中文摘要}
	\vspace*{-1ex}
	\begin{center} \heiti \Large 摘~~~~要 \end{center}
	\vspace*{4ex}
	
}{
	\vspace{2em}
	{\noindent \heiti 关键词：} \cnkeyword
	\clearpage
}


% ----------------- 英文摘要环境 ----------------
%\fontspec{Microsoft YaHei}

\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{Abstract}}
	\chaptermark{英文摘要}
	\vspace*{-1ex}
	\begin{center} \Large \bfseries Abstract \end{center} 
	\vspace*{2ex}
}{
	\vspace{1.5em}
	{\noindent \bfseries Key Words: } \enkeyword
	%\paragraph{\bfseries Key Words: } \enkeyword
	\clearpage
}


%%%%%%%%%%%%%%%%%%%%%%%%% 定义新的目录页面 %%%%%%%%%%%%%%%%%%

\RequirePackage{tocloft}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor  = black,
	citecolor = black
} %去掉目录红框
\renewcommand{\cfttoctitlefont}{\hfill \heiti \zihao{-2}}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{2ex}
\setlength{\cftaftertoctitleskip}{3ex}
% \renewcommand{\cftbeforeloftitleskip}{0.5em}
% \renewcommand{\cftafterloftitleskip}{0.5em}
\renewcommand{\cftsecdotsep}{\cftdotsep} %设置Section引导点
\renewcommand{\cftbeforesecskip}{0em} %设置段间距
%\renewcommand{\cftpartfont}{\songti \bfseries}%设置Part字体
%\renewcommand{\cftsecfont}{\songti \bfseries}%设置Section字体

% 使用条件语句
\RequirePackage{xstring}

% 定义两个新语句
% 第一个语句更改fancyhdr样式
\newcommand{\plainfooterstyle}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{\footstyle}
		{pagenumtoc}{\footstyle}}
}
% 第二个语句在目录中添加目录标签
\newcommand{\addtoctotoc}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{}
		{pagenumtoc}{\phantomsection
			\addcontentsline{toc}{chapter}{目录}}}
}



%------------- 设置新的生成目录命令 ---------------
\let \oldtableofcontens \tableofcontents
\newcommand{\maketoc}[1][nopagenum]{
	% 修改hdr原plain格式
	\fancypagestyle{plain}{%
		\fancyhf{} %清空原有样式
		\headstyle
		\plainfooterstyle{#1}
	}
	% 设置目录hdr和页码选项
	\clearpage
	\pagestyle{plain}
	\addtoctotoc{#1}
	\tableofcontents
	\clearpage
	\pagestyle{main}
}



%%%%%%%%%%%%%%%%%%%%%%% 定义新的致谢环境 %%%%%%%%%%%%%%%%%

\newenvironment{thankpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{致谢}
	\chapter*{致谢}
	\chaptermark{致谢}
}{
	\clearpage
}



%%%%%%%%%%%%%%%%%%%%%%% 重新定义参考文献页 %%%%%%%%%%%%%%%%%%%%%
% 
% ------------- 设置参考文献 -------------

\bibliographystyle{plain}
\ctexset{bibname={参考文献}}

% 设置新的附录命令
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	%添加到目录
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{参考文献}
	\oldbibliography{#1}
}



%%%%%%%%%%%%%%%%%% 定义新的环境研究成果 %%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{researchpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{攻读硕士学位期间的研究成果}
	\chapter*{攻读硕士学位期间的研究成果}
	\chaptermark{攻读硕士学位期间的研究成果}
}{
	\clearpage
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

