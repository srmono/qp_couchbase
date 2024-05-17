In Couchbase Full-Text Search (FTS), the score for each document is calculated based on how well it matches the search query. Let's break it down:


# Full-Text Search Score Calculation Examples

## 1. Relevance
**Description:** 
Relevance scoring measures how closely a document matches the search query. It takes into account factors like term frequency, inverse document frequency, and term proximity.

**Example:**
Consider a search query for "apple pie recipe". A document containing all three terms in close proximity (e.g., "The best apple pie recipe") would receive a higher relevance score compared to a document containing only one or two of the terms.

## 2. Term Frequency (TF)
**Description:** 
Term frequency measures how often a search term appears in a document. Documents containing the search terms multiple times are considered more relevant.

**Example:**
If a document contains the term "apple pie" mentioned five times, it might score higher than a document with the same terms mentioned only once.

## 3. Inverse Document Frequency (IDF)
**Description:** 
Inverse document frequency measures the uniqueness or rarity of a term across all documents in the index. Terms that appear in fewer documents are considered more relevant.

**Example:**
Suppose the term "apple" appears in many documents across the index, while "pie" is less common. A document containing "pie" may receive a higher IDF score, making it more relevant despite the term "apple" being more frequent.

## 4. Field Boosting
**Description:** 
Field boosting allows assigning different weights or boosts to specific fields in documents. This influences the overall score of a document based on where search terms appear.

**Example:**
Boosting the "title" field over the "body" field means a document with search terms in the title would receive a higher score compared to the same terms in the body.

## 5. Length Normalization
**Description:** 
Length normalization adjusts scores to account for document length. It ensures that longer documents don't automatically receive higher scores due to containing more occurrences of search terms.

**Example:**
A longer document might naturally contain more occurrences of search terms. Length normalization ensures fairness by adjusting scores appropriately.

## 6. Term Proximity
**Description:** 
Term proximity considers the distance between search terms within a document. Closer proximity indicates higher relevance.

**Example:**
Search terms "apple pie recipe" occurring in sequence might receive a higher score compared to the terms scattered throughout the document.

## 7. Field Relevance
**Description:** 
Field relevance considers the importance of the field where search terms appear. Terms in more relevant fields (e.g., "title" vs. "comments") receive higher scores.

**Example:**
A document where search terms appear in the title field might receive a higher score compared to the same terms appearing in less relevant fields.

```

This Markdown file provides detailed descriptions along with examples for each factor involved in the scoring process of Full-Text Search in Couchbase.