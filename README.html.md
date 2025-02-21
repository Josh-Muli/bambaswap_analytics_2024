<!DOCTYPE html>
<html>
<head>
<title>README.md.md</title>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">

<style>
/* https://github.com/microsoft/vscode/blob/master/extensions/markdown-language-features/media/markdown.css */
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

body {
	font-family: var(--vscode-markdown-font-family, -apple-system, BlinkMacSystemFont, "Segoe WPC", "Segoe UI", "Ubuntu", "Droid Sans", sans-serif);
	font-size: var(--vscode-markdown-font-size, 14px);
	padding: 0 26px;
	line-height: var(--vscode-markdown-line-height, 22px);
	word-wrap: break-word;
}

#code-csp-warning {
	position: fixed;
	top: 0;
	right: 0;
	color: white;
	margin: 16px;
	text-align: center;
	font-size: 12px;
	font-family: sans-serif;
	background-color:#444444;
	cursor: pointer;
	padding: 6px;
	box-shadow: 1px 1px 1px rgba(0,0,0,.25);
}

#code-csp-warning:hover {
	text-decoration: none;
	background-color:#007acc;
	box-shadow: 2px 2px 2px rgba(0,0,0,.25);
}

body.scrollBeyondLastLine {
	margin-bottom: calc(100vh - 22px);
}

body.showEditorSelection .code-line {
	position: relative;
}

body.showEditorSelection .code-active-line:before,
body.showEditorSelection .code-line:hover:before {
	content: "";
	display: block;
	position: absolute;
	top: 0;
	left: -12px;
	height: 100%;
}

body.showEditorSelection li.code-active-line:before,
body.showEditorSelection li.code-line:hover:before {
	left: -30px;
}

.vscode-light.showEditorSelection .code-active-line:before {
	border-left: 3px solid rgba(0, 0, 0, 0.15);
}

.vscode-light.showEditorSelection .code-line:hover:before {
	border-left: 3px solid rgba(0, 0, 0, 0.40);
}

.vscode-light.showEditorSelection .code-line .code-line:hover:before {
	border-left: none;
}

.vscode-dark.showEditorSelection .code-active-line:before {
	border-left: 3px solid rgba(255, 255, 255, 0.4);
}

.vscode-dark.showEditorSelection .code-line:hover:before {
	border-left: 3px solid rgba(255, 255, 255, 0.60);
}

.vscode-dark.showEditorSelection .code-line .code-line:hover:before {
	border-left: none;
}

.vscode-high-contrast.showEditorSelection .code-active-line:before {
	border-left: 3px solid rgba(255, 160, 0, 0.7);
}

.vscode-high-contrast.showEditorSelection .code-line:hover:before {
	border-left: 3px solid rgba(255, 160, 0, 1);
}

.vscode-high-contrast.showEditorSelection .code-line .code-line:hover:before {
	border-left: none;
}

img {
	max-width: 100%;
	max-height: 100%;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

a:focus,
input:focus,
select:focus,
textarea:focus {
	outline: 1px solid -webkit-focus-ring-color;
	outline-offset: -1px;
}

hr {
	border: 0;
	height: 2px;
	border-bottom: 2px solid;
}

h1 {
	padding-bottom: 0.3em;
	line-height: 1.2;
	border-bottom-width: 1px;
	border-bottom-style: solid;
}

h1, h2, h3 {
	font-weight: normal;
}

table {
	border-collapse: collapse;
}

table > thead > tr > th {
	text-align: left;
	border-bottom: 1px solid;
}

table > thead > tr > th,
table > thead > tr > td,
table > tbody > tr > th,
table > tbody > tr > td {
	padding: 5px 10px;
}

table > tbody > tr + tr > td {
	border-top: 1px solid;
}

blockquote {
	margin: 0 7px 0 5px;
	padding: 0 16px 0 10px;
	border-left-width: 5px;
	border-left-style: solid;
}

code {
	font-family: Menlo, Monaco, Consolas, "Droid Sans Mono", "Courier New", monospace, "Droid Sans Fallback";
	font-size: 1em;
	line-height: 1.357em;
}

body.wordWrap pre {
	white-space: pre-wrap;
}

pre:not(.hljs),
pre.hljs code > div {
	padding: 16px;
	border-radius: 3px;
	overflow: auto;
}

pre code {
	color: var(--vscode-editor-foreground);
	tab-size: 4;
}

/** Theming */

.vscode-light pre {
	background-color: rgba(220, 220, 220, 0.4);
}

.vscode-dark pre {
	background-color: rgba(10, 10, 10, 0.4);
}

.vscode-high-contrast pre {
	background-color: rgb(0, 0, 0);
}

.vscode-high-contrast h1 {
	border-color: rgb(0, 0, 0);
}

.vscode-light table > thead > tr > th {
	border-color: rgba(0, 0, 0, 0.69);
}

.vscode-dark table > thead > tr > th {
	border-color: rgba(255, 255, 255, 0.69);
}

.vscode-light h1,
.vscode-light hr,
.vscode-light table > tbody > tr + tr > td {
	border-color: rgba(0, 0, 0, 0.18);
}

.vscode-dark h1,
.vscode-dark hr,
.vscode-dark table > tbody > tr + tr > td {
	border-color: rgba(255, 255, 255, 0.18);
}

</style>

<style>
/* Tomorrow Theme */
/* http://jmblog.github.com/color-themes-for-google-code-highlightjs */
/* Original theme - https://github.com/chriskempson/tomorrow-theme */

/* Tomorrow Comment */
.hljs-comment,
.hljs-quote {
	color: #8e908c;
}

/* Tomorrow Red */
.hljs-variable,
.hljs-template-variable,
.hljs-tag,
.hljs-name,
.hljs-selector-id,
.hljs-selector-class,
.hljs-regexp,
.hljs-deletion {
	color: #c82829;
}

/* Tomorrow Orange */
.hljs-number,
.hljs-built_in,
.hljs-builtin-name,
.hljs-literal,
.hljs-type,
.hljs-params,
.hljs-meta,
.hljs-link {
	color: #f5871f;
}

/* Tomorrow Yellow */
.hljs-attribute {
	color: #eab700;
}

/* Tomorrow Green */
.hljs-string,
.hljs-symbol,
.hljs-bullet,
.hljs-addition {
	color: #718c00;
}

/* Tomorrow Blue */
.hljs-title,
.hljs-section {
	color: #4271ae;
}

/* Tomorrow Purple */
.hljs-keyword,
.hljs-selector-tag {
	color: #8959a8;
}

.hljs {
	display: block;
	overflow-x: auto;
	color: #4d4d4c;
	padding: 0.5em;
}

.hljs-emphasis {
	font-style: italic;
}

.hljs-strong {
	font-weight: bold;
}
</style>

<style>
/*
 * Markdown PDF CSS
 */

 body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe WPC", "Segoe UI", "Ubuntu", "Droid Sans", sans-serif, "Meiryo";
	padding: 0 12px;
}

pre {
	background-color: #f8f8f8;
	border: 1px solid #cccccc;
	border-radius: 3px;
	overflow-x: auto;
	white-space: pre-wrap;
	overflow-wrap: break-word;
}

pre:not(.hljs) {
	padding: 23px;
	line-height: 19px;
}

blockquote {
	background: rgba(127, 127, 127, 0.1);
	border-color: rgba(0, 122, 204, 0.5);
}

.emoji {
	height: 1.4em;
}

code {
	font-size: 14px;
	line-height: 19px;
}

/* for inline code */
:not(pre):not(.hljs) > code {
	color: #C9AE75; /* Change the old color so it seems less like an error */
	font-size: inherit;
}

/* Page Break : use <div class="page"/> to insert page break
-------------------------------------------------------- */
.page {
	page-break-after: always;
}

</style>

<script src="https://unpkg.com/mermaid/dist/mermaid.min.js"></script>
</head>
<body>
  <script>
    mermaid.initialize({
      startOnLoad: true,
      theme: document.body.classList.contains('vscode-dark') || document.body.classList.contains('vscode-high-contrast')
          ? 'dark'
          : 'default'
    });
  </script>
<p><strong>BAMBASWAP KPI ANALYSIS</strong></p>
<p>Period:  October 2024</p>
<h1 id="introduction"><strong>Introduction</strong></h1>
<p>This report provides an in-depth analysis of Bambaswap's key performance indicators (KPIs) from January to October 2024, focusing on Customer Acquisition Rate (CAR), Monthly Recurring Revenue (MRR), Retention Rate, and Customer Lifetime Value (CLV).</p>
<p>By examining these KPIs, we aim to understand customer growth trends, revenue sustainability, retention challenges, and overall business health. A particular focus is placed on October 2024, where significant shifts in these metrics highlight critical business challenges.</p>
<p>This analysis is done using the PostgreSql and you can find all the queries here: <a href="/https://github.com/Josh-Muli/bambaswap_analytisc_2024/blob/df1a03cdf693e421f8e2e3caf670d7c8e0b01b71/bs_sql_code_2024/">Bambaswap October Analysis 2024</a></p>
<h1 id="tools-used"><strong>Tools Used</strong></h1>
<p>For my deep dive into the SwapFintech data analysis and KPI's, I harnessed the power of several key tools:</p>
<p><strong>SQL:</strong> The backbone of my analysis, allowing me to query the database and unearth critical insights.</p>
<p><strong>PostgreSQL:</strong> The chosen database management system, ideal for handling the SwapFintech data.</p>
<p><strong>Visual Studio Code:</strong> My go-to for database management and executing SQL queries.</p>
<p><strong>Power BI:</strong> Essential for visuals utilized during the analysis.</p>
<p><strong>Git &amp; GitHub:</strong> Essential for version control and sharing my SQL scripts and analysis, ensuring collaborations and project tracking.</p>
<h1 id="the-analysis"><strong>The Analysis</strong></h1>
<p>Each query for this project aimed at investigating specific aspect of the SwapFintech KPI's. KPIs identified for the Swap Fintech to track progress and drive business growth include:-</p>
<ul>
<li><strong>Customer Acquisition Rate (C.A.R)</strong></li>
<li><strong>Cusomer Conversion Rate (C.C.R)</strong></li>
<li><strong>Monthly Recurring Revenue (M.R.R)</strong></li>
<li><strong>Monthly Retention Rate (R.R)</strong></li>
<li><strong>Churn Rate (C.R)</strong></li>
<li><strong>Customer Lifetime Value (C.L.V)</strong></li>
</ul>
<h3 id="1-customer-acquisition-rate-car"><strong>1.	Customer Acquisition Rate (C.A.R)</strong></h3>
<p><strong>Customer Acquisition Rate (CAR)</strong> The <strong>Customer Acquisition Rate</strong> measure how many new customers a BambaSwap has gained over a period relative to its existing customer base. In our case, we calculate <strong>CAR</strong> month by month from January to September as historical data and focusing on
October in this report.</p>
<p>To calculate the <strong>CAR</strong> we utilized the formula:-</p>
<p>$$
\mathit{CAR_{m}} = \frac{\mathit{Returning\ Customers\ Before\ Month\ m}}{\mathit{New\ Customers\ in\ Month\ m}} \times 100
$$</p>
<p>Where;-</p>
<p>• <strong>New Customers in Month m</strong> : Customer who appeared in month m <strong>(October)</strong> but was not a returning customer.</p>
<p>Identified by checking if the phone_number exists in October but (do not exist) in earlier data. (Jan to Sep 2024)</p>
<p>• <strong>Returning Customers</strong> : BambaSwap customers whohave made transactions atleast 3 times before October (January to September).</p>
<p>This ensures that we only consider customers who have shown consistent engagement.</p>
<p>sql query used :-</p>
<pre class="hljs"><code><div><span class="hljs-keyword">WITH</span> customer_counts <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Count occurrences of each customer per month</span>
    <span class="hljs-keyword">SELECT</span> phone_number, <span class="hljs-keyword">month</span>, month_number, <span class="hljs-keyword">COUNT</span>(*) <span class="hljs-keyword">AS</span> occurrences
    <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> phone_number, <span class="hljs-keyword">month</span>, month_number
),
cumulative_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Track when a customer first appeared and their total count before each month</span>
    <span class="hljs-keyword">SELECT</span> c1.phone_number, c1.month, c1.month_number,
        (<span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">COUNT</span>(*)
         <span class="hljs-keyword">FROM</span> customer_counts c2
         <span class="hljs-keyword">WHERE</span> c2.phone_number = c1.phone_number
         <span class="hljs-keyword">AND</span> c2.month_number &lt; c1.month_number) <span class="hljs-keyword">AS</span> prior_count
    <span class="hljs-keyword">FROM</span> customer_counts c1
),
returning_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Identify customers who had 3+ occurrences before a given month</span>
    <span class="hljs-keyword">SELECT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
    <span class="hljs-keyword">FROM</span> cumulative_customers
    <span class="hljs-keyword">WHERE</span> prior_count &gt;= <span class="hljs-number">3</span>
),
monthly_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Get unique customers per month</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
    <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
),
new_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Find new customers (not in returning customers for that month)</span>
    <span class="hljs-keyword">SELECT</span> m.phone_number, m.month, m.month_number
    <span class="hljs-keyword">FROM</span> monthly_customers m
    <span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> returning_customers r 
    <span class="hljs-keyword">ON</span> m.phone_number = r.phone_number <span class="hljs-keyword">AND</span> m.month = r.month
    <span class="hljs-keyword">WHERE</span> r.phone_number <span class="hljs-keyword">IS</span> <span class="hljs-literal">NULL</span>
)
<span class="hljs-comment">-- Calculate CAR per month and replace NULL values</span>
<span class="hljs-keyword">SELECT</span> 
    m.month, 
    m.month_number,
    <span class="hljs-comment">-- Ensure no NULL values by using COALESCE and GREATEST</span>
    <span class="hljs-keyword">COALESCE</span>((<span class="hljs-keyword">COUNT</span>(n.phone_number) * <span class="hljs-number">100.0</span> / <span class="hljs-keyword">GREATEST</span>(<span class="hljs-keyword">COUNT</span>(r.phone_number), <span class="hljs-number">1</span>)), <span class="hljs-number">0</span>) <span class="hljs-keyword">AS</span> acquisition_rate
<span class="hljs-keyword">FROM</span> monthly_customers m
<span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> new_customers n <span class="hljs-keyword">ON</span> m.phone_number = n.phone_number <span class="hljs-keyword">AND</span> m.month = n.month
<span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> returning_customers r <span class="hljs-keyword">ON</span> m.phone_number = r.phone_number <span class="hljs-keyword">AND</span> m.month = r.month
<span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> m.month, m.month_number
<span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> m.month_number;
</div></code></pre>
<p><img src="Oct_2024\car_jan_oct_2024_image.png" alt="Average Acquisition Rate"></p>
<p><em>A powerBI generated waterfall graph showing the monthly changes in the average aquisition rates for SwapFintech in the month of October.</em></p>
<p>From the analysis and graph respesentation, the following conclusions can be drawn.</p>
<p>1️⃣ <strong>Drastic Drop Compared to Early Months</strong></p>
<p>• In <strong>January and February</strong>, CAR was extremely high <em>(521,000% and 369,800%)</em>, likely due to a surge in new customers.</p>
<p>• By <strong>October</strong>, CAR fell to <em>591.2%</em>, indicating a much lower rate of new customer acquisition compared to the earlier months.</p>
<p>2️⃣ <strong>Steady CAR in Mid-Year, but October Is Higher than September</strong></p>
<p>• From <strong>June to August</strong>, CAR was around <em>10,700–10,900%</em>, showing stable acquisition rates.</p>
<p>• In <strong>September</strong>, CAR dropped to just <em>9.8%</em>, but in <strong>October</strong>, it rebounded slightly to <em>591.2%</em>, suggesting a small increase in new customer sign-ups.</p>
<p>3️⃣ <strong>October's CAR Reflects a More Mature Market</strong></p>
<p>• The early months <strong>(Jan–Mar)</strong> had explosive growth, likely from aggressive marketing or a new product launch.</p>
<p>• The lower CAR in <strong>October</strong> signals that the market may be stabilizing, with fewer brand-new customers entering the system.</p>
<h3 id="2-customer-conversion-rate-ccr"><strong>2.	Customer Conversion Rate (C.C.R)</strong></h3>
<p><strong>Customer Conversion Rate</strong> measures how many BambaSwap existing customers (who have used the service before) return in a given month. It helps BambaSwap understand customer retention—how well Bambaswap keeps their customers engaged over time.</p>
<p>How is <strong>CCR</strong> Different from <strong>CAR</strong>?
•	<strong>Customer Acquisition Rate (CAR)</strong> measures how many new customers are added in a month.
•	<strong>Customer Conversion Rate (CCR)</strong> measures how many of those who were customers in previous months come back in the current month.</p>
<p>The formula emoployed to calculate the CCR is :-</p>
<p>$$
\mathit{CCR_{m}} = \frac {\mathit{Returning\ Customers\ in\ Month\ m}}{\mathit{Total\ Customers\ who\ Appeared\ in\ Previous\ Months}} \times 100
$$</p>
<p>Where:</p>
<p>• <strong>Returning Customers:</strong> Filters out customers who reappear after being seen in any previous months.</p>
<p>• <strong>Total Customers who Appeared in Month m:</strong> we count how many times a customer appeared in months before m. If past_occurrences &gt; 0, it means the customer was seen in a previous month.</p>
<p>What Insights Does This CCR Provide?
•	<em>A High CCR (Near 100%)</em> → Great retention! Most Bambaswap customers who have used the service before are coming back.
•	<em>A Low CCR (Close to 0%)</em> → Poor retention! Bambaswap Customers are not returning after their first experience.
•	<em>Fluctuating CCR Trends</em> → Could indicate Bambaswap seasonal customer behavior or an issue with customer satisfaction.</p>
<p>sql query used :-</p>
<pre class="hljs"><code><div><span class="hljs-keyword">WITH</span> monthly_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Get distinct customers per month</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
    <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
),
previous_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Identify all customers who appeared before the current month</span>
    <span class="hljs-keyword">SELECT</span> mc1.phone_number, mc1.month, mc1.month_number,
           <span class="hljs-keyword">COUNT</span>(mc2.phone_number) <span class="hljs-keyword">AS</span> past_occurrences
    <span class="hljs-keyword">FROM</span> monthly_customers mc1
    <span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> monthly_customers mc2
    <span class="hljs-keyword">ON</span> mc1.phone_number = mc2.phone_number 
    <span class="hljs-keyword">AND</span> mc2.month_number &lt; mc1.month_number
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc1.phone_number, mc1.month, mc1.month_number
),
returning_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Customers who have appeared in at least one previous month</span>
    <span class="hljs-keyword">SELECT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
    <span class="hljs-keyword">FROM</span> previous_customers
    <span class="hljs-keyword">WHERE</span> past_occurrences &gt; <span class="hljs-number">0</span>
)
<span class="hljs-comment">-- Calculate CCR</span>
<span class="hljs-keyword">SELECT</span> 
    mc.month, 
    mc.month_number,
    <span class="hljs-comment">-- Compute CCR: returning customers / total customers from previous months</span>
    <span class="hljs-keyword">COALESCE</span>((<span class="hljs-keyword">COUNT</span>(rc.phone_number) * <span class="hljs-number">100.0</span> / <span class="hljs-keyword">GREATEST</span>(<span class="hljs-keyword">COUNT</span>(pc.phone_number), <span class="hljs-number">1</span>)), <span class="hljs-number">0</span>) <span class="hljs-keyword">AS</span> conversion_rate
<span class="hljs-keyword">FROM</span> monthly_customers mc
<span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> returning_customers rc 
<span class="hljs-keyword">ON</span> mc.phone_number = rc.phone_number <span class="hljs-keyword">AND</span> mc.month = rc.month
<span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> previous_customers pc 
<span class="hljs-keyword">ON</span> mc.phone_number = pc.phone_number <span class="hljs-keyword">AND</span> mc.month_number = pc.month_number
<span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc.month, mc.month_number
<span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> mc.month_number;

</div></code></pre>
<p><img src="Oct_2024\ccr_jan_oct_2024_image.png" alt="Customer Conversion Rate"></p>
<p><em>A powerBI generated waterfall graph showing the monthly SwapFintech average conversion rates</em></p>
<p>From the above customer conversion anaysis, the following conclusions were made :-</p>
<p>1️⃣ <strong>Significant Drop from September</strong></p>
<p>• <strong>September</strong> had a <em>99.1%</em> <strong>CCR</strong>, while October dropped to <em>28.5%</em>.</p>
<p>• This indicates a sharp decline in conversions, possibly due to seasonal trends, a change in marketing strategy, or lower customer retention.</p>
<p>2️⃣ <strong>Higher Than the Start of the Year</strong></p>
<p>• <strong>October's</strong> <em>28.5%</em> <strong>CCR</strong> is lower than the peak months <strong>(July–September)</strong> but still higher than <strong>February</strong> <em>(12.5%)</em> and <strong>March</strong> <em>(34%)</em>.</p>
<p>• This suggests some level of customer engagement is being maintained despite the decline.</p>
<p>3️⃣ <strong>Potential Disruptions or Market Changes</strong></p>
<p>• The huge gap between <strong>August</strong> <em>(98.1%)</em> and <strong>October</strong> <em>(28.5%)</em> suggests external factors—maybe a policy change, customer behavior shift, or reduced promotions.</p>
<p>• Investigating customer acquisition strategies and market trends could help understand the cause.</p>
<h3 id="3-monthly-recurring-revenue-mrr"><strong>3.	Monthly Recurring Revenue (M.R.R)</strong></h3>
<p><strong>Monthly Recurring Revenue (MRR)</strong> is a key financial metric that measures the predictable and recurring revenue BambaSwap earns each month from returning customers.</p>
<p>•	It excludes one-time payments and focuses only on customers who continue to pay over time.</p>
<p>•	For our dataset, <strong>MRR</strong> tracks revenue from customers who have paid before (in any previous period) and are paying again</p>
<p>How <em>MRR</em> is Different from <em>Total Revenue</em>?</p>
<p>• <strong>Total Revenue</strong> - tracks All payments made in a given month, including first-time customers.
• <strong>MRR</strong> - Only revenue from returning customers (customers who have paid before).</p>
<p><em>Why This Matters:</em></p>
<p><strong>MRR</strong> is crucial for understanding customer retention and revenue stability. If <strong>MRR</strong> is growing, it means the BambaSwap business is retaining and monetizing existing customers well.</p>
<p>The formula that was employed to calculate the <em>MMR</em>:</p>
<p>$$
\mathit {MMR} = {Sum\ of\ { Revenue\ from\ Recurring\ Customers\ in\ Month\ m}}
$$</p>
<p>Where:</p>
<p>• <em>Recurring Customers</em>: Customers who have paid in any previous month and return in month m.</p>
<p>• <em>Revenue</em>:The sum of Bambaswap revenue from all returning customers in month m.</p>
<p><em>What Insights Can We Get From This MRR Calculation?</em></p>
<p>• If <strong>MRR</strong> is growing → More customers are returning and paying again → Good retention &amp; revenue stability.</p>
<p>• If <strong>MRR</strong> is declining → Fewer customers are returning → Possible churn issue.</p>
<p>• If <strong>MRR</strong> fluctuates → Indicates seasonality or inconsistent customer retention trends.</p>
<p>• If <strong>MRR</strong> is <em>0</em> in a month with transactions → That month only had new customers (not returning ones).</p>
<p>The sql query used :-</p>
<pre class="hljs"><code><div><span class="hljs-keyword">WITH</span> monthly_revenue <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Get total revenue per customer per month</span>
    <span class="hljs-keyword">SELECT</span> phone_number, <span class="hljs-keyword">month</span>, month_number, <span class="hljs-keyword">SUM</span>(bs_revenue) <span class="hljs-keyword">AS</span> total_revenue
    <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> phone_number, <span class="hljs-keyword">month</span>, month_number
),
previous_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Identify customers who have paid in any month before or after the current month</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> mr1.phone_number, mr1.month, mr1.month_number
    <span class="hljs-keyword">FROM</span> monthly_revenue mr1
    <span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> monthly_revenue mr2
    <span class="hljs-keyword">ON</span> mr1.phone_number = mr2.phone_number 
    <span class="hljs-keyword">AND</span> mr2.month_number &lt; mr1.month_number  <span class="hljs-comment">-- Customer has past payments</span>
    <span class="hljs-keyword">WHERE</span> mr2.phone_number <span class="hljs-keyword">IS</span> <span class="hljs-keyword">NOT</span> <span class="hljs-literal">NULL</span>
),
recurring_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Customers who made payments in previous months OR will make payments later</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
    <span class="hljs-keyword">FROM</span> previous_customers
    <span class="hljs-keyword">UNION</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> mr1.phone_number, mr1.month, mr1.month_number
    <span class="hljs-keyword">FROM</span> monthly_revenue mr1
    <span class="hljs-keyword">JOIN</span> monthly_revenue mr2
    <span class="hljs-keyword">ON</span> mr1.phone_number = mr2.phone_number 
    <span class="hljs-keyword">AND</span> mr1.month_number &gt; mr2.month_number  <span class="hljs-comment">-- Customer pays again later</span>
)
<span class="hljs-comment">-- Calculate MRR per month</span>
<span class="hljs-keyword">SELECT</span> 
    mr.month, 
    mr.month_number,
    <span class="hljs-keyword">COALESCE</span>(<span class="hljs-keyword">SUM</span>(mr.total_revenue), <span class="hljs-number">0</span>) <span class="hljs-keyword">AS</span> monthly_recurring_revenue
<span class="hljs-keyword">FROM</span> monthly_revenue mr
<span class="hljs-keyword">INNER</span> <span class="hljs-keyword">JOIN</span> recurring_customers rc 
<span class="hljs-keyword">ON</span> mr.phone_number = rc.phone_number <span class="hljs-keyword">AND</span> mr.month = rc.month
<span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mr.month, mr.month_number
<span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> mr.month_number;

</div></code></pre>
<p><img src="Oct_2024\mRecurring_r_jan_oct_2024_image.png" alt="Monthly Recurring Rate"></p>
<p><em>A powerBI generated graph showing the monthly changes in ARPU and Monthly Recurring Rate for SwapFintech</em></p>
<p>Here are three main summary insights from the Monthly Recurring Revenue (MRR) data for Bambaswap from January to September 2024:</p>
<p>1️⃣ <strong>October Had the Lowest MRR of the Year</strong></p>
<p>• <strong>October’s</strong> <em>MRR</em> dropped to <em>ksh. 723,034</em>, the lowest recorded value in the dataset.</p>
<p>• This suggests a decline in recurring revenue, possibly due to customer churn, lower renewals, or reduced engagement.</p>
<p>2️⃣ <strong>Steady Decline Since Mid-Year</strong></p>
<p>• After peaking in <strong>March</strong> <em>(ksh. 876,220)</em>, MRR showed a downward trend, with fluctuations but an overall decline.</p>
<p>• From <em>September to October</em>, MRR fell further (ksh 765,124 → ksh 723,034), signaling a continued drop in retention.</p>
<p>3️⃣ <strong>MRR Is Lower Despite a Slight CAR Increase</strong></p>
<p>• In <strong>October</strong>, CAR (Customer Acquisition Rate) slightly rebounded from <strong>September’s</strong> low <em>(9.8% to 591.2%)</em>, meaning new customers were acquired.</p>
<p>• However, <strong>MRR</strong> still declined, indicating that revenue loss from churned customers may have outweighed new revenue.</p>
<h3 id="4-monthly-retention-rate-mrr"><strong>4.	Monthly Retention Rate (M.R.R)</strong></h3>
<p><strong>The Retention Rate (R.R)</strong> is a key customer success metric that measures the percentage of BambaSwap existing customers who continue paying month after month.</p>
<p>•	It tells us how well the bambaswap retains customers over time.</p>
<p>•	A high retention rate indicates strong customer loyalty, while a low rate suggests customer churn (customers are leaving).</p>
<p>To calculate the <strong>Retention Rate (R.R)</strong>, we used the following formula:</p>
<p>$$
\mathit {Retention Rate}_{(m)} = (\frac {{\mathit Returning\ Customers\ Month\ m}}{\mathit {Total\ Customers\ in\ Month\ m-1}}) \mathit {\times 100}
$$</p>
<p>Where:</p>
<p>•	<em>Returning Customers in Month m</em> → Bambaswap Customers who paid in m-1 and continue paying in m.</p>
<p>•	<em>Total Customers in Month m-1</em> → All unique customers who paid in the previous month.</p>
<p><em>What Insights Can We Get From This Query?</em></p>
<p>• If Retention Rate is high → Customers continue using the service, indicating strong loyalty.</p>
<p>• If Retention Rate is dropping → Churn rate is increasing, meaning customers are leaving.</p>
<p>• If Retention Rate is 0% for a month → No customers from m-1 returned in m.</p>
<p>• Seasonal Retention Trends → If retention fluctuates, it could be due to seasonal demand or product changes.</p>
<p>Query used was to calculate the <strong>MRR</strong> is:-</p>
<pre class="hljs"><code><div><span class="hljs-keyword">WITH</span> monthly_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Get distinct paying customers per month</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
    <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
    
),
previous_month_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Count total customers in the previous month</span>
    <span class="hljs-keyword">SELECT</span> mc1.month <span class="hljs-keyword">AS</span> previous_month, mc1.month_number <span class="hljs-keyword">AS</span> previous_month_number, <span class="hljs-keyword">COUNT</span>(<span class="hljs-keyword">DISTINCT</span> mc1.phone_number) <span class="hljs-keyword">AS</span> total_previous_customers
    <span class="hljs-keyword">FROM</span> monthly_customers mc1
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc1.month, mc1.month_number
),
returning_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Count returning customers (who paid in `m-1` and are still paying in `m`)</span>
    <span class="hljs-keyword">SELECT</span> mc2.month <span class="hljs-keyword">AS</span> current_month, mc2.month_number <span class="hljs-keyword">AS</span> current_month_number, <span class="hljs-keyword">COUNT</span>(<span class="hljs-keyword">DISTINCT</span> mc2.phone_number) <span class="hljs-keyword">AS</span> returning_customers
    <span class="hljs-keyword">FROM</span> monthly_customers mc2
    <span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> monthly_customers mc1  <span class="hljs-comment">-- Use LEFT JOIN instead of INNER JOIN</span>
    <span class="hljs-keyword">ON</span> mc2.phone_number = mc1.phone_number
    <span class="hljs-keyword">AND</span> mc2.month_number = mc1.month_number + <span class="hljs-number">1</span>  <span class="hljs-comment">-- Ensures they paid in both `m-1` and `m`</span>
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc2.month, mc2.month_number
)
<span class="hljs-comment">-- Calculate Monthly Retention Rate</span>
<span class="hljs-keyword">SELECT</span> 
    pm.previous_month,
    pm.previous_month_number,
    <span class="hljs-keyword">COALESCE</span>(rc.current_month, <span class="hljs-string">'No Returning Customers'</span>) <span class="hljs-keyword">AS</span> current_month,
    <span class="hljs-keyword">COALESCE</span>(rc.current_month_number, pm.previous_month_number + <span class="hljs-number">1</span>) <span class="hljs-keyword">AS</span> current_month_number,
    <span class="hljs-keyword">COALESCE</span>((rc.returning_customers * <span class="hljs-number">100.0</span> / <span class="hljs-keyword">GREATEST</span>(pm.total_previous_customers, <span class="hljs-number">1</span>)), <span class="hljs-number">0</span>) <span class="hljs-keyword">AS</span> retention_rate
<span class="hljs-keyword">FROM</span> previous_month_customers pm
<span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> returning_customers rc 
<span class="hljs-keyword">ON</span> pm.previous_month_number + <span class="hljs-number">1</span> = rc.current_month_number
<span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> pm.previous_month_number;

</div></code></pre>
<p><img src="Oct_2024\mRetention_r_jan_oct_2024_image.png" alt="Monthly Retention Rate"></p>
<p><em>A powerBI generated graph showing the monthly changes in Monthly Retention Rate</em></p>
<p>Here are the main insights drawn from the analyzed BambaSwap Retention Rate.</p>
<p>1️⃣ <strong>Retention Declined in October Alongside MRR Drop</strong></p>
<p>• <strong>October’s</strong> retention rate likely dropped, as <strong>MRR</strong> fell to <em>ksh.723,034</em>, the lowest recorded value in the dataset.</p>
<p>• This suggests higher churn or fewer renewals, impacting long-term revenue stability.</p>
<p>2️⃣ <strong>Sustained Decline Since March’s Peak</strong></p>
<p>• <strong>March</strong> had the highest <strong>MRR</strong> <em>(ksh. 876,220)</em>, indicating strong customer retention at that time.</p>
<p>• Since then, <strong>MRR</strong> has steadily decreased, suggesting that retention has weakened over time, leading to revenue shrinkage.</p>
<p>3️⃣ <strong>New Customers in October Didn’t Fully Offset Churn</strong></p>
<p>• Despite a small rebound in Customer Acquisition Rate (CAR) in <strong>October</strong>, overall <strong>MRR</strong> and retention still declined.</p>
<p>• This means more customers likely churned than were retained, signaling a retention strategy issue.</p>
<h3 id="5-monthly-churn-rate-rr"><strong>5.	Monthly Churn Rate (R.R)</strong></h3>
<p><strong>Churn Rate</strong> measures the percentage of Bambaswap customers who stop paying from one month to the next. It is the opposite of Retention Rate.</p>
<p>•	If Retention Rate is high, Churn Rate is low → Business is retaining customers well.</p>
<p>•	If Churn Rate is high, it means many customers are leaving the service.</p>
<p>To calculate the <strong>Churn Rate</strong>, use the following formula:</p>
<p>$$
\mathit{Churn\ Rate}_{(m)} = \frac{\mathit{Customers\ who\ Left\ in\ Month\ m}}{\mathit{Total\ Customers\ in\ Month\ m-1}} \times 100
$$</p>
<p>Where:</p>
<p>•	<em>Churned Customers in Month m</em> → Customers who paid in m-1 but did not pay in m.</p>
<p>•	<em>Total Customers in Month m-1</em> → All unique customers who paid in m-1.</p>
<p><em>What Insights Can We Get?</em></p>
<p>• If Churn Rate is high → Many customers are leaving → Possible retention issues.</p>
<p>• If Churn Rate is low → Customers are staying &amp; continuing to pay.</p>
<p>• If Churn Rate fluctuates → Could indicate seasonal trends or business model changes.</p>
<p>• If Churn Rate is 0% for a month → No customers from m-1 left (great retention).</p>
<p>Here is the sql query used for the churn rate;-</p>
<pre class="hljs"><code><div><span class="hljs-keyword">WITH</span> monthly_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Get distinct paying customers per month</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
    <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
),
previous_month_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Count total customers in the previous month</span>
    <span class="hljs-keyword">SELECT</span> mc1.month <span class="hljs-keyword">AS</span> previous_month, 
           mc1.month_number <span class="hljs-keyword">AS</span> previous_month_number, 
           <span class="hljs-keyword">COUNT</span>(<span class="hljs-keyword">DISTINCT</span> mc1.phone_number) <span class="hljs-keyword">AS</span> total_previous_customers
    <span class="hljs-keyword">FROM</span> monthly_customers mc1
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc1.month, mc1.month_number
),
returning_customers <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Count returning customers (who paid in `m-1` and are still paying in `m`)</span>
    <span class="hljs-keyword">SELECT</span> mc2.month <span class="hljs-keyword">AS</span> current_month, 
           mc2.month_number <span class="hljs-keyword">AS</span> current_month_number, 
           <span class="hljs-keyword">COUNT</span>(<span class="hljs-keyword">DISTINCT</span> mc2.phone_number) <span class="hljs-keyword">AS</span> returning_customers
    <span class="hljs-keyword">FROM</span> monthly_customers mc2
    <span class="hljs-keyword">JOIN</span> monthly_customers mc1
    <span class="hljs-keyword">ON</span> mc2.phone_number = mc1.phone_number
    <span class="hljs-keyword">AND</span> mc2.month_number = mc1.month_number + <span class="hljs-number">1</span>  <span class="hljs-comment">-- Ensures they paid in both `m-1` and `m`</span>
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc2.month, mc2.month_number
)
<span class="hljs-comment">-- Calculate Monthly Churn Rate</span>
<span class="hljs-keyword">SELECT</span> 
    pm.previous_month,
    pm.previous_month_number,
    <span class="hljs-keyword">COALESCE</span>(rc.current_month, <span class="hljs-string">'No Returning Customers'</span>) <span class="hljs-keyword">AS</span> current_month,
    <span class="hljs-keyword">COALESCE</span>(rc.current_month_number, pm.previous_month_number + <span class="hljs-number">1</span>) <span class="hljs-keyword">AS</span> current_month_number,
    <span class="hljs-comment">-- Churn Rate = (Total Customers in `m-1` - Returning Customers in `m`) / Total Customers in `m-1`</span>
    <span class="hljs-keyword">COALESCE</span>(((pm.total_previous_customers - <span class="hljs-keyword">COALESCE</span>(rc.returning_customers, <span class="hljs-number">0</span>)) * <span class="hljs-number">100.0</span> / 
              <span class="hljs-keyword">GREATEST</span>(pm.total_previous_customers, <span class="hljs-number">1</span>)), <span class="hljs-number">0</span>) <span class="hljs-keyword">AS</span> churn_rate
<span class="hljs-keyword">FROM</span> previous_month_customers pm
<span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> returning_customers rc 
<span class="hljs-keyword">ON</span> pm.previous_month_number + <span class="hljs-number">1</span> = rc.current_month_number
<span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> pm.previous_month_number;

</div></code></pre>
<p><img src="Oct_2024\churn_rate_jan_oct_2024_image.png" alt="Churn Rate Graph"></p>
<p><em>A powerBI generated graph showing the monthly changes in Monthly Churn Rate</em></p>
<p>SwapFintech churn Rate insight from the above analysis ;-</p>
<ol>
<li><strong>High Initial Churn Rates and Sudden Spikes:</strong> The churn rate is extremely high in the first five months, with <strong>May</strong> showing a full <em>100%</em> churn rate. This suggests that a significant number of customers are leaving in the early stages, potentially indicating initial dissatisfaction or unmet expectations.</li>
<li><strong>Drastic Reduction in Churn Post-May:</strong> Starting from <strong>June</strong>, there is a notable drop in churn rates (<em>3.96%</em> in <strong>June</strong>, <em>7%</em> in <strong>July</strong>, <em>4%</em> in <strong>August</strong>), indicating an improvement in customer retention or fewer new customers to churn. This drop may reflect targeted retention efforts, improvements in product satisfaction, or a reduced acquisition pace.</li>
<li><strong>Recurring High Churn Instances:</strong> Another 100% churn appears in <strong>September</strong>, similar to <strong>May</strong>. This sharp recurrence could signal specific issues surfacing cyclically (like quarterly review processes or seasonally dissatisfied customers), or it could indicate particular external factors impacting customer retention around these times.</li>
</ol>
<h3 id="6-customer-lifetime-value-clv"><strong>6.	Customer Lifetime Value (CLV)</strong></h3>
<p><strong>Customer Lifetime Value (CLV)</strong> estimates the total revenue Bambaswap can expect from a single customer over their entire relationship with Bambaswap.</p>
<p>•	Higher CLV means customers stay longer and spend more.</p>
<p>•	Lower CLV suggests short customer relationships or low spending.</p>
<p>BambaSwap CLV is calculated on a monthly using the formula:-</p>
<p>$$
\mathit {CLV}_{m} = ARPU_m\ \times (\frac {\mathit{1}}{\mathit {Churn\ Rate_m}}) \times 100
$$</p>
<p>where:</p>
<p>• <strong>ARPU (Average Revenue Per User):</strong> This is calculated as the total revenue in month m divided by the total customers in month m.</p>
<p>• <strong>Churn Rate:</strong> The percentage of customers who did not return in the following month.</p>
<p>The below query was utilized to calculate the CLV</p>
<pre class="hljs"><code><div><span class="hljs-keyword">WITH</span> monthly_revenue <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Get total revenue per month</span>
    <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">month</span>, month_number, <span class="hljs-keyword">SUM</span>(bs_revenue) <span class="hljs-keyword">AS</span> total_revenue, <span class="hljs-keyword">COUNT</span>(<span class="hljs-keyword">DISTINCT</span> phone_number) <span class="hljs-keyword">AS</span> total_customers
    <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
    <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> <span class="hljs-keyword">month</span>, month_number
),
churn_data <span class="hljs-keyword">AS</span> (
    <span class="hljs-comment">-- Get churn rate per month (from previous churn rate query)</span>
    <span class="hljs-keyword">WITH</span> monthly_customers <span class="hljs-keyword">AS</span> (
        <span class="hljs-comment">-- Get distinct paying customers per month</span>
        <span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">DISTINCT</span> phone_number, <span class="hljs-keyword">month</span>, month_number
        <span class="hljs-keyword">FROM</span> bambaswap_combined_jan_oct_2024
        
    ),
    previous_month_customers <span class="hljs-keyword">AS</span> (
        <span class="hljs-comment">-- Count total customers in the previous month</span>
        <span class="hljs-keyword">SELECT</span> mc1.month <span class="hljs-keyword">AS</span> previous_month, 
               mc1.month_number <span class="hljs-keyword">AS</span> previous_month_number, 
               <span class="hljs-keyword">COUNT</span>(<span class="hljs-keyword">DISTINCT</span> mc1.phone_number) <span class="hljs-keyword">AS</span> total_previous_customers
        <span class="hljs-keyword">FROM</span> monthly_customers mc1
        <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc1.month, mc1.month_number
    ),
    returning_customers <span class="hljs-keyword">AS</span> (
        <span class="hljs-comment">-- Count returning customers (who paid in `m-1` and are still paying in `m`)</span>
        <span class="hljs-keyword">SELECT</span> mc2.month <span class="hljs-keyword">AS</span> current_month, 
               mc2.month_number <span class="hljs-keyword">AS</span> current_month_number, 
               <span class="hljs-keyword">COUNT</span>(<span class="hljs-keyword">DISTINCT</span> mc2.phone_number) <span class="hljs-keyword">AS</span> returning_customers
        <span class="hljs-keyword">FROM</span> monthly_customers mc2
        <span class="hljs-keyword">JOIN</span> monthly_customers mc1
        <span class="hljs-keyword">ON</span> mc2.phone_number = mc1.phone_number
        <span class="hljs-keyword">AND</span> mc2.month_number = mc1.month_number + <span class="hljs-number">1</span>  <span class="hljs-comment">-- Ensures they paid in both `m-1` and `m`</span>
        <span class="hljs-keyword">GROUP</span> <span class="hljs-keyword">BY</span> mc2.month, mc2.month_number
    )
    <span class="hljs-comment">-- Calculate Monthly Churn Rate</span>
    <span class="hljs-keyword">SELECT</span> 
        pm.previous_month,
        pm.previous_month_number,
        rc.current_month,
        rc.current_month_number,
        <span class="hljs-comment">-- Churn Rate = (Total Customers in `m-1` - Returning Customers in `m`) / Total Customers in `m-1`</span>
        <span class="hljs-keyword">COALESCE</span>(((pm.total_previous_customers - <span class="hljs-keyword">COALESCE</span>(rc.returning_customers, <span class="hljs-number">0</span>)) * <span class="hljs-number">1.0</span> / 
                  <span class="hljs-keyword">GREATEST</span>(pm.total_previous_customers, <span class="hljs-number">1</span>)), <span class="hljs-number">0</span>) <span class="hljs-keyword">AS</span> churn_rate
    <span class="hljs-keyword">FROM</span> previous_month_customers pm
    <span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> returning_customers rc 
    <span class="hljs-keyword">ON</span> pm.previous_month_number + <span class="hljs-number">1</span> = rc.current_month_number
)
<span class="hljs-comment">-- Calculate CLV per month</span>
<span class="hljs-keyword">SELECT</span> 
    mr.month, 
    mr.month_number,
    (mr.total_revenue * <span class="hljs-number">1.0</span> / <span class="hljs-keyword">NULLIF</span>(mr.total_customers, <span class="hljs-number">0</span>)) <span class="hljs-keyword">AS</span> ARPU,  <span class="hljs-comment">-- Avoid division by zero</span>
    cd.churn_rate,
    <span class="hljs-keyword">CASE</span> 
        <span class="hljs-keyword">WHEN</span> cd.churn_rate = <span class="hljs-number">0</span> <span class="hljs-keyword">THEN</span> <span class="hljs-literal">NULL</span>  <span class="hljs-comment">-- Prevent division by zero</span>
        <span class="hljs-keyword">ELSE</span> (mr.total_revenue / <span class="hljs-keyword">NULLIF</span>(mr.total_customers, <span class="hljs-number">0</span>)) * (<span class="hljs-number">1.0</span> / cd.churn_rate)
    <span class="hljs-keyword">END</span> <span class="hljs-keyword">AS</span> customer_lifetime_value
<span class="hljs-keyword">FROM</span> monthly_revenue mr
<span class="hljs-keyword">LEFT</span> <span class="hljs-keyword">JOIN</span> churn_data cd 
<span class="hljs-keyword">ON</span> mr.month_number = cd.previous_month_number
<span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> mr.month_number;

</div></code></pre>
<p><img src="Oct_2024\clv_jan_oct_2024_image.png" alt="CLV graph"></p>
<p>From the above analysis,the following insights were drawn;-</p>
<p>1️⃣ <strong>October Had the Lowest CLV of the Year</strong></p>
<p>• <strong>CLV</strong> in <strong>October</strong> dropped to just <em>163.74</em>, the lowest recorded value, signaling poor long-term revenue per customer.</p>
<p>• This sharp decline suggests high churn and low revenue retention.</p>
<p>2️⃣ <strong>Churn Rate Hit 100% in October</strong></p>
<p>• A <strong>1.00 (100%)</strong> churn rate means every customer left, leading to near-zero customer lifetime value.</p>
<p>• Even though <strong>August</strong> had the highest CLV <em>(ksh. 837,089)</em>, the drop in retention from <strong>September</strong> to <strong>October</strong> erased customer value.</p>
<p>3️⃣ <strong>Drastic ARPU Decline Contributed to CLV Drop</strong></p>
<p>• <strong>Average Revenue Per User (ARPU)</strong> in <strong>October</strong> fell to <em>ksh. 163.73</em>, a huge drop from <strong>August</strong> <em>(ksh. 7,750.82)</em> and <strong>September</strong> <em>(ksh. 6,831.46)</em>.</p>
<p>• Low <strong>ARPU + high churn = collapsed CLV</strong>, making <strong>October</strong> a critical month for retention issues.</p>
<h1 id="conclusion"><strong>Conclusion</strong></h1>
<p>For <strong>October</strong>, all key performance indicators (KPIs) point to a major customer retention crisis:</p>
<p>• <strong>Customer Acquisition Rate (CAR)</strong>: <em>Increased</em> slightly from September but wasn't enough to offset customer churn.</p>
<p>• <strong>Monthly Recurring Revenue (MRR)</strong>: <em>Dropped</em> to <em>ksh. 723,034</em>, the <em>lowest</em> of the year, signaling revenue loss.</p>
<p>• <strong>Retention Rate</strong>: <em>Declined</em> further, with a high churn rate eroding recurring revenue.</p>
<p>• <strong>Customer Lifetime Value (CLV)</strong>: <em>Crashed</em> to <em>ksh. 163.74</em>, due to 100% churn, meaning no long-term revenue from customers.</p>
<p>👉 <strong>Final Insight</strong>: <strong>October's</strong> customer retention issues significantly impacted revenue and long-term customer value, making it crucial to focus on <strong>reducing churn</strong> and <strong>improving engagement</strong> strategies.</p>

</body>
</html>
