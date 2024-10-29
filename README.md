Disable Telemetry on Windows
Overview
After a recent Windows update, I discovered that Telemetry (Windows-Recall) had re-enabled itself without my consent, despite explicit rulings from European courts against this practice. This inspired me to create a solution that integrates telemetry settings directly into the Unattend.xml file.

Purpose
This repository provides a PowerShell script to easily disable telemetry on Windows, ensuring it remains disabled, even through updates. This approach offers transparent control over data-sharing settings, aligning with privacy best practices—especially for EU citizens.

Whether you’re setting up new installations or managing updates, feel free to use this script as a starting point or modify it to suit your system needs.

How to Use
Simply add the script to your Windows Unattend.xml file configuration, and it will automatically prevent telemetry from re-enabling.

