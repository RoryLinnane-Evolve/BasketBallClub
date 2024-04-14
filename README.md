# Clare Cascaders Basketball Club Registration System

## Overview
This repository contains the source code for the Clare Cascaders Basketball Club Registration System. The system was developed to streamline the registration process for club members, addressing issues with clunky software. 

## Features
- **Dynamic Registration System:** The system adapts based on the number of players being registered and applicable discounts, simplifying the process for the registrar.
- **Integration with Basketball Ireland:** Initially, the system supported both standalone registration and integration with Basketball Ireland's software for registration. However, due to policy changes, it later interfaced directly with Basketball Ireland's software.
- **Secure Payment Integration:** Initially planned to use Stripe, the system ultimately integrated with PayPal for its simplicity and familiarity.
- **Confidential Data Handling:** The system employs a relational database to manage member information, ensuring confidentiality, especially regarding health information.

## Technologies Used
- **Frontend:** ASP.NET Webforms with Bootstrap CSS for a clean and responsive user interface.
- **Backend:** Microsoft SQL Express for database management, utilizing Datasets (.xsd) for seamless database connectivity.
- **Payment Integration:** PayPal Button.
- **Version Control:** Git was used for version control and code management.

## Functionality
- **Dynamic Forms:** The player registration form dynamically adjusts fields based on the player's date of birth, optimizing input for child and adult players.
- **Discount Handling:** Discounts for the registration fee are managed via a setup table in the database, allowing for rate adjustments without hardcoding.
- **User Authentication:** User login and registration forms ensure secure access to the system, enhancing data security.

## Known Issues
- Due to time constraints, some functions may not be optimized or may lack robust error handling.
- As of the last update, the system interfaces with Basketball Ireland's software, but future policy changes may require further adjustments.


