# BD Gender Detector for Google Tag Manager

Technical documentation for the BD Gender Detector variable template.

## Overview

BD Gender Detector is a specialized Google Tag Manager (GTM) variable template engineered for the Bangladesh market. It leverages a comprehensive database of over 1,000 regional names, prefixes, and suffixes to infer user gender (Male/Female) from name strings with high statistical accuracy.

## Business Objectives

- **Targeted Segmentation:** Enables the creation of gender-specific audiences for platforms like Meta and Google Ads without requiring additional fields in the checkout process.
- **Resource Optimization:** Facilitates data-driven budget allocation by identifying the gender demographics that drive the highest conversion rates.
- **User Experience:** Provides demographic insights while maintaining a frictionless user journey.

## Core Capabilities

- **Extensive Database:** Includes a curated library of over 1,000 unique Bangladeshi male and female identifiers.
- **Linguistic Analysis:** Correctly parses local honorifics and suffixes such as `Md`, `Mst`, `Uddin`, `Akter`, `Khatun`, and others.
- **Data Sanitation:** Performs automated string cleaning, including the removal of punctuation and special characters, prior to classification.
- **Safe Fallback:** Returns an `unknown` value if a definitive classification cannot be reached.

## Configuration Instructions

1. **Deployment:** Import `template.tpl` into the GTM Web Container.
2. **Variable Setup:** Select "BD Gender Detector" as the variable type.
3. **Mapping:** Assign the "Full Name Data Layer Variable" to the variable containing the user's name string.
4. **Integration:** Utilize the output variable within the `gender` custom parameter of your marketing tags (e.g., Meta Pixel, GA4).

## Detection Logic Reference

| Input Name | Classification | Logic |
| :--- | :--- | :--- |
| `Md. Arif Hossain` | `male` | Identifier: `Md` and `Hossain` |
| `Mst. Sumaiya Akter` | `female` | Identifier: `Mst` and `Akter` |
| `Suman Ahmed` | `male` | Match: Male Name Bank |
| `Nadia Sultana` | `female` | Match: Female Name Bank |

## Technical Support and Attribution

Developed and maintained by **Md Sadikul Islam Shadin**.

Refer to the [official documentation](https://www.linkedin.com/in/sadikulshadin/) for further updates and tracking solutions.
