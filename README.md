# Public-CredVerify-Passwords-Scan

#### Scan a hashed password list and compare to hashes returned by CredVerify password API call

This project contains a sample PowerShell script to show how to scan an existing hashed password list and call VeriCloud CredVerify Password API to verify if the users' passwords have been leaked in previous data breaches. VeriClouds leaked password database contains billions leaked passwords from data breaches.  

A test run of the script could be implemented as following

1. Use a tool to dump users password hashes from an existing system to file "hash.txt"
2. Run the PowerShell script as ```.\HashCheck.ps1 hash.txt```

A production run of the script could be implemented as following

1. Rewrite the PowerShell script to retrieve the passwords hash from an existing system into a list.
2. Go through the hash list and call CredVerify Password API to verify each hash.
3. Print out the result for each check or take action based on the result of the check.

### Run the Powershell as

```PS C:\Users\Me\Desktop\HashCheck> .\HashCheck.ps1 hash.txt```  
```Password Hash, Leaked```   
```7C4A8D09CA3762AF61E59520943DC26494F8941B, Yes```  
```F7B1113DEA0224ECC6DCED041447CACC56FB738A, No```  
```9B79BC21E6C52C406B24BDA4A175BF82EF70337A, No```  
```0C87E860D25CE07198652972B42649F3B940BBCB, No```  
```6ADFB183A4A2C94A2F92DAB5ADE762A47889A5A1, Yes```  

### Note:
Please also reference VeriClouds project [VeriClouds-Extension-for-Exchange-Server](https://github.com/appbugs/VeriClouds-Extension-for-Exchange-Server) to see how to retrieve password hash from Active Directory and update Exchange service with leaked password info. The API service in VeriClouds-Extension-for-Exchange-Server project is deprecated and has been replaced by VeriClouds Password API. 
