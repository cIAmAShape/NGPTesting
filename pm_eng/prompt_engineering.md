# Prompt Engineering

Large Language Models (LLMs) like ChatGPT are powerful tools trained on massive amounts of text to predict and generate human-like language. They don’t "think" or "reason" the way humans do; instead, they statistically predict the next word in a sentence based on the input they’ve seen. <br />

Because LLMs respond based on patterns, *how you ask a question directly affects the quality of the answer*. This is why **prompt engineering** — the practice of crafting inputs to get the most effective outputs — is so important. It helps bridge the gap between your intention and what the model actually delivers. <br />

The main thing that you need to know: asking just one question is **rarely** enough to help. Unless you have a generic and simple problem — such as asking an LLM to remind you what the area of a sphere is — it likely won’t be a result applicable to your research. But don't fret! There are ways to get the results you are looking for.

### Basic Steps

You need to start with an *informed, reasonable question* that you have at least some basic research on. Then, you can ask the LLM a series of questions that (ideally) build on one another. Here is the way to go about that:
1. Use the LLM to suggest **reputable** reading material on your question or problem.
2. Based on what you learn from your reading, ask your first question
3. *Refine* your question based on the answer it gave you. 
4. Test the proposed *solution / insight* to the *issue / body of knowledge*, and once again refine your question. 
5. Continue this loop of refining and testing your query until the issue is resolved.

~~put something here~~


## Exercise Requirements
For this activity, you will need a wifi-enabled web browser and access to an LLM. You can use any LLM you choose, but we have listed a few below:

| LLM Model                                 | Notes on model                                     | URL |
|-------------------------------------------|----------------------------------------------------|-----|
| OpenAI ChatGPT (GPT-3.5)                  | No account required <br />Cannot reliably browse the web |[Chat GPT](https://chatgpt.com/)|
| Claude.ai (Claude 3 Haiku)                | Good in-depth reasoning <br />Requires an Account        |[Claude](https://claude.ai/)|
| Hugging Face Chat (Mistral, Zephyr, etc.) | Flexible options <br />Requires an Account               |[HuggingFace](https://huggingface.co/)|

## Prompt Engineering Tips

These tips are inspired by OpenAI’s [official prompt engineering](https://help.openai.com/en/articles/6654000-best-practices-for-prompt-engineering-with-the-openai-api) best practices that we have tailored for generating high-complexity Python code to handle simulations, mathematical modeling, and other related fields.<br /> 

To be clear, these tips are **not** just for Python code. They work great in whatever field you are looking towards and are applicable in most - if not all - fields. Our exercises that we will be doing later are simply about graphical Python.<br />

Without further ado, here are the tips!

---

### 1. Do Your Research

**Tip:** To write a clear and specific prompt, you need to have a good understanding of the thing you're modeling. If you're not already an expert, do some research using *non-LLM-generated sources.* LLM models are a **supplement** to knowledge, not a **replacement**. <br />

**Why It Works:** LLMs (like ChatGPT) can sometimes "hallucinate"—they’ll give confident-sounding answers that may not be factually correct. To avoid being misled, always cross-check important information using **reputable, verifiable sources**. You can use the model to help *find* sources if it can see the internet or has it cached—but then you should verify that those sources are real and trustworthy. <br />

#### Reputable Source Types

1. University Course Websites
   * Look for .edu domains or syllabi from instutions like MIT OpenCourseWare, Harvard CS, UC Berkeley, etc.
   * Example: MIT 18.06 Linear Algebra
2. Scientific Journals & Prepint Servers
   Peer-reviewed journals via:
   * Google Scholar
   * PubMed
   * arXiv
   **Tip:** Ask the LLM to find the DOI or publisher link, then visit that site.
3. Textbooks and Reference Books
   You can get these suggested by a model, but you can verify them on:
   * OpenStax
   * Project Gutenberg
4. Educational Coding Platforms
   Python/math tutorials from:
   * Real Python
   * GeeksforGeeks
   * W3schools
5. Government and Academic Research Instritutions
   Reputable sites with .gov or .org domains, such as:
   * NASA
   * NOAA
   * Oak Ridge National Laboratory
   * National Institues of Health
6. Professional Societies
   * IEEE, ACM, AMS, SIAM, APS, etc. offer trusted publications and learning resources.
   * They often have "student resources" sections.


