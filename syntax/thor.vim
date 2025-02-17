" VIM syntax file
" Language: THOR log files
" Author: Mathias Stuhlmacher
" Reference: https://github.com/stuhli/vim-thor

" check for existing syntax files
if exists("b:current_syntax")
    finish
endif

" regex for IP address - needs to stay before 'generic messages regex'
syn match ThorIp /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/

" highlight SHA256 hashes for easier copypaste
syn match ThorHash '\s[a-f0-9]\{64}'

" advanced RegExes
" - @<= is zero-width lookup matches to avoid conflicts with the matches of FILE: and
"   SCORE: because normally only one match per string is allowed.
" - \n\? to work after F7 split lines
" - [A-Z]\{3,10}... is the following EXT:, REASON:, ...

" highlight filenames
syn match ThorFilename '\(FILE_\?\d\{0,3}_\?\d\{0,3}:\)\@<= .\{-1,1000} \n\?\([A-Z]\{3,10}_\?[A-Z]\{0,10}_\?\d\{0,3}_\?\d\{0,3}: \)\@='
syn match ThorFilename '\(ARCHIVE_\?\d\{0,3}_\?\d\{0,3}:\)\@<= .\{-1,1000} \n\?\([A-Z]\{3,10}_\?[A-Z]\{0,10}_\?\d\{0,3}_\?\d\{0,3}: \)\@='
" highlight scores from 80 to 100 (according to https://github.com/Neo23x0/YARA-Style-Guide#score)
syn match ThorHighScore '\(SCORE:\)\@<= \(\(8\|9\)\d\|100\) \n\?\([A-Z]\{3,10}_\?\d\{0,3}: \)\@='

" modules
syn match ThorModule 'MODULE: .* \zeMESSAGE'

" generic messages regex - put special messages afterwards to override this
syn match ThorMessage 'MESSAGE: .* \zeSCANID'

" message for IP address - needs to stay after 'generic messages regex'
syn match ThorMessage 'MESSAGE: IP Address \d\{1,2}:'

" scan ID
syn match ThorScanid 'SCANID:\s\S\+'

" results
syn match ThorImportant 'ALERTS:'
syn match ThorImportant 'WARNINGS:'
syn match ThorImportant 'ERRORS:'

" message types
syn match ThorImportant '\sAlert:\s'
syn match ThorImportant '^Alert:\s'
syn match ThorImportant '\sWarning:\s'
syn match ThorImportant '^Warning:\s'
syn match ThorImportant '\sError:\s'
syn match ThorImportant '^Error:\s'
syn match ThorBodyField '\sNotice:\s'
syn match ThorBodyField '^Notice:\s'

" important matches - analysis
syn match ThorImportant 'MESSAGE: Evil Event ID'
syn match ThorImportant 'MESSAGE: Evil service'
syn match ThorImportant 'MESSAGE: Evil user in list of running processes'
syn match ThorImportant 'MESSAGE: Evil user match in file handle details'
syn match ThorImportant 'MESSAGE: Keyword found in Log Entry'
syn match ThorImportant 'MESSAGE: Keyword found in eventlog entry'
syn match ThorImportant 'MESSAGE: Keyword found in registry hive entries'
syn match ThorImportant 'MESSAGE: Malicious archived file found'
syn match ThorImportant 'MESSAGE: Malicious file name in eventlog entry found'
syn match ThorImportant 'MESSAGE: malicious named pipe found'
syn match ThorImportant 'MESSAGE: Malware file found'
syn match ThorImportant 'MESSAGE: Malware filename in Log Entry found'
syn match ThorImportant 'MESSAGE: Malware file name in .* found \zeSCANID'
syn match ThorImportant 'MESSAGE: Possibly Dangerous file found'
syn match ThorImportant 'MESSAGE: critical Sigma match on eventlog entry'
syn match ThorImportant 'MESSAGE: critical Sigma match on Eventlog record'
syn match ThorImportant 'MESSAGE: high Sigma match on eventlog entry'
syn match ThorImportant 'MESSAGE: high Sigma match on Eventlog record'

" important matches - regarding ThorDb
syn match ThorImportant 'MESSAGE: Could not create ThorDB table (most likely caused by insufficient privileges)'
syn match ThorImportant 'MESSAGE: Found last scan start with same context'
syn match ThorImportant 'MESSAGE: Previous scan was interrupted, resuming scan'
syn match ThorImportant 'MESSAGE: Successfully created ThorDB'
syn match ThorImportant 'MESSAGE: Successfully closed ThorDB'
syn match ThorImportant 'MESSAGE: Successfully opened ThorDB'

" important matches - regarding administration / qa / errors
syn match ThorImportant 'MESSAGE: 32 bit THOR was executed on 64 bit system. For improved results, use the 64 bit version of THOR.'
syn match ThorImportant 'MESSAGE: Activating soft mode due to .* \zeSCANID'
syn match ThorImportant 'MESSAGE: Added virtual mapping'
syn match ThorImportant 'MESSAGE: Argument List: \[.*\]'
syn match ThorImportant 'MESSAGE: Available physical memory dropped below 50 MB'
syn match ThorImportant 'MESSAGE: Configuration file in package failed verification'
syn match ThorImportant 'MESSAGE: Connection output threshold reached. Output truncated.'
syn match ThorImportant 'MESSAGE: Corrupt /etc/passwd entry, skipping entry'
syn match ThorImportant 'MESSAGE: Could not read sigma config'
syn match ThorImportant 'MESSAGE: Could not .* \zeSCANID'
syn match ThorImportant 'MESSAGE: Effective argument [Ll]ist: \[.*\]'
syn match ThorImportant 'MESSAGE: Following alert, warning, notice and debug messages are silenced due to license restrictions'
syn match ThorImportant 'MESSAGE: Intense Scan Mode'
syn match ThorImportant 'MESSAGE: Last scanned Element'
syn match ThorImportant 'MESSAGE: Logged more than 64 MB, exiting THOR to prevent log flooding due to a high number of false positives'
syn match ThorImportant 'MESSAGE: Lowering THOR .* due to soft mode'
syn match ThorImportant 'MESSAGE: Maximum runtime has exceeded, killing THOR'
syn match ThorImportant "MESSAGE: No rules with DEEPSCAN tag found. THOR won't scan any files with YARA rules. Please ensure that you use up-to-date signatures."
syn match ThorImportant 'MESSAGE: No valid license file found'
syn match ThorImportant 'MESSAGE: Process with high memory usage'
syn match ThorImportant 'MESSAGE: Quick Scan Mode'
syn match ThorImportant 'MESSAGE: RAR decompress is disabled'
syn match ThorImportant 'MESSAGE: Received interrupt signal.'
syn match ThorImportant 'MESSAGE: Run on system: \S\+'
syn match ThorImportant "MESSAGE: Skip sigma initialization, use '--sigma' flag to scan with sigma"
syn match ThorImportant 'MESSAGE: System has been identified as domain controller'
syn match ThorImportant 'MESSAGE: System is a domain controller'
syn match ThorImportant 'MESSAGE: System is not a domain controller'
syn match ThorImportant 'MESSAGE: Signature Database:  \zeSCANID'
syn match ThorImportant "MESSAGE: Signature file is older than \d\{1,3} days. Run 'thor-util upgrade' to get new signatures."
syn match ThorImportant 'MESSAGE: Some modules and features are not available in Lite version and will be disabled'
syn match ThorImportant 'MESSAGE: Stopping THOR scan in order to avoid a memory outage (use --norescontrol to avoid this)'
syn match ThorImportant 'MESSAGE: System Type: \S\+'
syn match ThorImportant 'MESSAGE: This THOR Lite license permits .* \zeSCANID'
syn match ThorImportant "MESSAGE: THOR should be started 'As Administrator' to have full access to files, process memory and the security eventlog"
syn match ThorImportant "MESSAGE: THOR should be started as 'As Administrator' to have full access to files, process memory and the security eventlog"
syn match ThorImportant "MESSAGE: THOR should be started as 'root' user to have full access to files"
syn match ThorImportant 'MESSAGE: THOR was terminated by interrupt command.'
syn match ThorImportant 'MESSAGE: Thor Scan finished'
syn match ThorImportant 'MESSAGE: Trial license detected'
syn match ThorImportant 'MESSAGE: UPX decompress is disabled'
syn match ThorImportant 'MESSAGE: User has admin rights: no'
syn match ThorImportant 'MESSAGE: User has admin rights: yes'

" fields
syn match ThorBodyField 'ACCESSED:'
syn match ThorBodyField 'ACTIVE:'
syn match ThorBodyField 'ACTIVE_MODULE:'
syn match ThorBodyField 'APPPATH_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'APP_\w\+:'
syn match ThorBodyField 'ARCH:'
syn match ThorBodyField 'ARCHIVE:'
syn match ThorBodyField 'ARCHIVE_\w\+:'
syn match ThorBodyField 'ARGUMENTS:'
syn match ThorBodyField 'AUTHOR_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'BADPWCOUNT:'
syn match ThorBodyField 'BEACON_C2:'
syn match ThorBodyField 'BEACON_INJECTION_PROCESS:'
syn match ThorBodyField 'BEACON_PIPENAME:'
syn match ThorBodyField 'BEACON_PORT:'
syn match ThorBodyField 'BEACON_PROXY:'
syn match ThorBodyField 'BEACON_SPAWNTO:'
syn match ThorBodyField 'BEACON_TYPE:'
syn match ThorBodyField 'BEACON_USER_AGENT:'
syn match ThorBodyField 'BUILD_NUMBER:'
syn match ThorBodyField 'CALLBACKINTERVAL:'
syn match ThorBodyField 'CAPTION:'
syn match ThorBodyField 'CHANGED:'
syn match ThorBodyField 'CHUNK_OFFSET:'
syn match ThorBodyField 'CLIENT:'
syn match ThorBodyField 'CLIENT_TYPE:'
syn match ThorBodyField 'CMD:'
syn match ThorBodyField 'COMMAND:'
syn match ThorBodyField 'COMMENT:'
syn match ThorBodyField 'COMPANY_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'CONNECTION_COUNT:'
syn match ThorBodyField 'CONTEXT:'
syn match ThorBodyField 'CORES:'
syn match ThorBodyField 'COUND:'
syn match ThorBodyField 'COUNT:'
syn match ThorBodyField 'CPU_COUNT:'
syn match ThorBodyField 'CREATED_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'CURRENT_ELEMENT_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'CURRENT_PATH:'
syn match ThorBodyField 'DATE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'DESC_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'DESCRIPTION_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'DIR:'
syn match ThorBodyField 'DIRECTORY:'
syn match ThorBodyField 'DOMAIN:'
syn match ThorBodyField 'DURATION:'
syn match ThorBodyField 'ELEMENT:'
syn match ThorBodyField 'ELEMENT_MATCH_COUNT:'
syn match ThorBodyField 'ENABLED:'
syn match ThorBodyField 'ENTRIES:'
syn match ThorBodyField 'ENTRY_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'ERROR_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'EVENTCONSUMER:'
syn match ThorBodyField 'EVENTCONSUMERNAME:'
syn match ThorBodyField 'EVENTFILTER:'
syn match ThorBodyField 'EVENTFILTERNAME:'
syn match ThorBodyField 'EVENT_CHANNEL:'
syn match ThorBodyField 'EVENT_COMPUTER:'
syn match ThorBodyField 'EVENT_ID:'
syn match ThorBodyField 'EVENT_LEVEL:'
syn match ThorBodyField 'EVENT_TIME:'
syn match ThorBodyField 'EXE:'
syn match ThorBodyField 'EXECUTABLE:'
syn match ThorBodyField 'EXEC_FLAG:'
syn match ThorBodyField 'EXE_GROUP:'
syn match ThorBodyField 'EXE_MAGIC:'
syn match ThorBodyField 'EXE_MODE:'
syn match ThorBodyField 'EXE_OWNER:'
syn match ThorBodyField 'EXE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'EXISTS_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'EXPIRES:'
syn match ThorBodyField 'EXT:'
syn match ThorBodyField 'FALSEPOSITIVES_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'FAULT_IN_MODULE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'FILE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'FILE_\w\+:'
syn match ThorBodyField 'FILES:'
syn match ThorBodyField 'FILTERTYPE:'
syn match ThorBodyField 'FIRSTBYTES_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'FIRST_BYTES:'
syn match ThorBodyField 'FIRST_RUN:'
syn match ThorBodyField 'FULL_NAME:'
syn match ThorBodyField 'GROUP:'
syn match ThorBodyField 'GROUPID:'
syn match ThorBodyField 'GROUP_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'GUID:'
syn match ThorBodyField 'HIVE:'
syn match ThorBodyField 'HOME:'
syn match ThorBodyField 'HOSTNAME:'
syn match ThorBodyField 'HOTFIX_ID:'
syn match ThorBodyField 'IDLE:'
syn match ThorBodyField 'ID_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'IMAGE_\w\+:'
syn match ThorBodyField 'IMPHASH_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'INSTALLED_BY:'
syn match ThorBodyField 'INSTALLED_ON:'
syn match ThorBodyField 'INTERNAL_NAME_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'IP:'
syn match ThorBodyField 'IS_ADMIN:'
syn match ThorBodyField 'JOB:'
syn match ThorBodyField 'KERNEL_\S\+:'
syn match ThorBodyField 'KEY:'
syn match ThorBodyField 'KEY_NAME:'
syn match ThorBodyField 'KEYWORD:'
syn match ThorBodyField 'LASTRUN:'
syn match ThorBodyField 'LAST_HOTFIX:'
syn match ThorBodyField 'LAST_LOGON:'
syn match ThorBodyField 'LAST_RESULT:'
syn match ThorBodyField 'LAST_RUN:'
syn match ThorBodyField 'LAST_STOPPED:'
syn match ThorBodyField 'LAUNCH_STRING:'
syn match ThorBodyField 'LEGAL_COPYRIGHT_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'LICENSE:'
syn match ThorBodyField 'LINK_FILE:'
syn match ThorBodyField 'LISTEN_PORTS:'
syn match ThorBodyField 'LOCATION:'
syn match ThorBodyField 'LOCKED:'
syn match ThorBodyField 'LOGONTYPE:'
syn match ThorBodyField 'LOG_ACCESSED:'
syn match ThorBodyField 'LOG_CREATED:'
syn match ThorBodyField 'LOG_MODIFIED:'
syn match ThorBodyField 'MATCH_STRINGS:'
syn match ThorBodyField 'MATCHED_STRINGS:'
syn match ThorBodyField 'MATCHING_STRINGS:'
syn match ThorBodyField 'MATCHED_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'MAX_RUNTIME:'
syn match ThorBodyField 'MD5_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'MODIFIED:'
syn match ThorBodyField 'MODULE_\d\{1,3}_\?\d\{0,3}:' " different RegEx because of THOR's modules
syn match ThorBodyField 'NAME_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'NEXTRUN:'
syn match ThorBodyField 'NOTICES:'
syn match ThorBodyField 'NO_EXPIRE:'
syn match ThorBodyField 'NUM_LOCKS:'
syn match ThorBodyField 'NUM_LOGONS:'
syn match ThorBodyField 'NUM_OPENS:'
syn match ThorBodyField 'ORIGINAL_NAME_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'ORIGINAL_PATH_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'OTHER_DOMAINS:'
syn match ThorBodyField 'OWNER_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'PARENT:'
syn match ThorBodyField 'PASSWORD:'
syn match ThorBodyField 'PASS_AGE:'
syn match ThorBodyField 'PATH:'
syn match ThorBodyField 'PATH_PERMS:'
syn match ThorBodyField 'PATTERN:'
syn match ThorBodyField 'PERM:'
syn match ThorBodyField 'PERMISSIONS:'
syn match ThorBodyField 'PID:'
syn match ThorBodyField 'PIPE:'
syn match ThorBodyField 'PORT:'
syn match ThorBodyField 'PPID:'
syn match ThorBodyField 'PROC:'
syn match ThorBodyField 'PROCESS:'
syn match ThorBodyField 'PROCESS_NAME:'
syn match ThorBodyField 'PROC_\w\+:'
syn match ThorBodyField 'PRODUCT_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'REASON_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'REASONS_COUNT:'
syn match ThorBodyField 'REF:'
syn match ThorBodyField 'REFERENCE:'
syn match ThorBodyField 'REF_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'REGISTRY_PATH:'
syn match ThorBodyField 'REPLACED:'
syn match ThorBodyField 'RIP:'
syn match ThorBodyField 'RPORT:'
syn match ThorBodyField 'RULE:'
syn match ThorBodyField 'RULEDATE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'RULENAME_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'RULE_\S\+:'
syn match ThorBodyField 'RUNLEVEL:'
syn match ThorBodyField 'RUN_AS_GROUP:'
syn match ThorBodyField 'RUN_AS_USER:'
syn match ThorBodyField 'SCANNED:'
syn match ThorBodyField 'SCANNED_ELEMENTS:'
syn match ThorBodyField 'SCANNER:'
syn match ThorBodyField 'SCHEDULE:'
syn match ThorBodyField 'SCORE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'SERVER:'
syn match ThorBodyField 'SERVERS:'
syn match ThorBodyField 'SERVICE_NAME:'
syn match ThorBodyField 'SESSION:'
syn match ThorBodyField 'SHA1_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'SHA256_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'SHARE_NAME:'
syn match ThorBodyField 'SHARE_PERMS:'
syn match ThorBodyField 'SHELL:'
syn match ThorBodyField 'SIGCLASS_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'SIGNAL:'
syn match ThorBodyField 'SIGNATURE:'
syn match ThorBodyField 'SIGTYPE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'SIZE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'STACK:'
syn match ThorBodyField 'START:'
syn match ThorBodyField 'STARTS:'
syn match ThorBodyField 'START_TYPE:'
syn match ThorBodyField 'STATUS:'
syn match ThorBodyField 'STRING:'
syn match ThorBodyField 'SUBSCORE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'TAGS_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'TARGET:'
syn match ThorBodyField 'TARGET_SIZE:'
syn match ThorBodyField 'TASKS:'
syn match ThorBodyField 'TASK_PATH:'
syn match ThorBodyField 'TID:'
syn match ThorBodyField 'TIME:'
syn match ThorBodyField 'TIMESTAMP_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'TOOK:'
syn match ThorBodyField 'TYPE_\?\d\{0,3}_\?\d\{0,3}:'
syn match ThorBodyField 'UNIT:'
syn match ThorBodyField 'UNIT_GROUP:'
syn match ThorBodyField 'UNIT_MODE:'
syn match ThorBodyField 'UNIT_OWNER:'
syn match ThorBodyField 'UNIT_PATH:'
syn match ThorBodyField 'USER:'
syn match ThorBodyField 'USERID:'
syn match ThorBodyField 'USERNAME:'
syn match ThorBodyField 'VALID:'
syn match ThorBodyField 'VALUE:'
syn match ThorBodyField 'VALUE_START:'
syn match ThorBodyField 'VAR:'
syn match ThorBodyField 'VARIABLE:'
syn match ThorBodyField 'VERSION:'
syn match ThorBodyField 'WITH:'
syn match ThorBodyField 'WORKER:'

" inline fields
syn match ThorBodyInlineField '$\{0,1}AccessList:'
syn match ThorBodyInlineField '$\{0,1}AccessMask:'
syn match ThorBodyInlineField '$\{0,1}AccessReason:'
syn match ThorBodyInlineField '$\{0,1}AccountExpires:'
syn match ThorBodyInlineField '$\{0,1}AccountName:'
syn match ThorBodyInlineField '$\{0,1}Action:'
syn match ThorBodyInlineField '$\{0,1}Action\s\{,1}Description:'
syn match ThorBodyInlineField '$\{0,1}Action\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Action\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}ActionName:'
syn match ThorBodyInlineField '$\{0,1}Additional\s\{,1}Actions\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Additional\s\{,1}Actions\s\{,1}String:'
syn match ThorBodyInlineField '$\{0,1}AdditionalInfo:'
syn match ThorBodyInlineField '$\{0,1}AdditionalInfo2:'
syn match ThorBodyInlineField '$\{0,1}AllowedToDelegateTo:'
syn match ThorBodyInlineField '$\{0,1}AppCorrelationID:'
syn match ThorBodyInlineField '$\{0,1}Application:'
syn match ThorBodyInlineField '$\{0,1}AttributeLDAPDisplayName:'
syn match ThorBodyInlineField '$\{0,1}AttributeSyntaxOID:'
syn match ThorBodyInlineField '$\{0,1}AttributeValue:'
syn match ThorBodyInlineField '$\{0,1}AuditPolicyChanges:'
syn match ThorBodyInlineField '$\{0,1}AuthenticationPackageName:'
syn match ThorBodyInlineField '$\{0,1}BackupPath:'
syn match ThorBodyInlineField '$\{0,1}Blocked file(#\d\{1,2}):'
syn match ThorBodyInlineField '$\{0,1}CallTrace:'
syn match ThorBodyInlineField '$\{0,1}Category\s\{,1}I[Dd]:'
syn match ThorBodyInlineField '$\{0,1}Category\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}Channel:'
syn match ThorBodyInlineField '$\{0,1}ClustersCount:'
syn match ThorBodyInlineField '$\{0,1}CommandLine:'
syn match ThorBodyInlineField '$\{0,1}Company:'
syn match ThorBodyInlineField '$\{0,1}Computer:'
syn match ThorBodyInlineField '$\{0,1}ComputerAccountChange:'
syn match ThorBodyInlineField '$\{0,1}Correlation.ActivityID:'
syn match ThorBodyInlineField '$\{0,1}CurrentDirectory:'
syn match ThorBodyInlineField '$\{0,1}Data:'
syn match ThorBodyInlineField '$\{0,1}Description:'
syn match ThorBodyInlineField '$\{0,1}DestAddress:'
syn match ThorBodyInlineField '$\{0,1}DestPort:'
syn match ThorBodyInlineField '$\{0,1}Details:'
syn match ThorBodyInlineField '$\{0,1}Detection\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Detection\s\{,1}Time:'
syn match ThorBodyInlineField '$\{0,1}Detection\s\{,1}User:'
syn match ThorBodyInlineField '$\{0,1}DisplayName:'
syn match ThorBodyInlineField '$\{0,1}Direction:'
syn match ThorBodyInlineField '$\{0,1}DnsHostName:'
syn match ThorBodyInlineField '$\{0,1}DSName:'
syn match ThorBodyInlineField '$\{0,1}DSType:'
syn match ThorBodyInlineField '$\{0,1}DurableHandle:'
syn match ThorBodyInlineField '$\{0,1}ElevatedToken:'
syn match ThorBodyInlineField '$\{0,1}Engine\s\{,1}Version:'
syn match ThorBodyInlineField '$\{0,1}Error\s\{,1}Code:'
syn match ThorBodyInlineField '$\{0,1}Error\s\{,1}Description:'
syn match ThorBodyInlineField '$\{0,1}EventID:'
syn match ThorBodyInlineField '$\{0,1}EventRecordID:'
syn match ThorBodyInlineField '$\{0,1}EventType:'
syn match ThorBodyInlineField '$\{0,1}EventID_Value:'
syn match ThorBodyInlineField '$\{0,1}Execution\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Execution\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}Execution.ProcessID:'
syn match ThorBodyInlineField '$\{0,1}Execution.ThreadID:'
syn match ThorBodyInlineField '$\{0,1}FailureReason:'
syn match ThorBodyInlineField '$\{0,1}File:'
syn match ThorBodyInlineField '$\{0,1}FileName:'
syn match ThorBodyInlineField '$\{0,1}FileNameLength:'
syn match ThorBodyInlineField '$\{0,1}FileOffset:'
syn match ThorBodyInlineField '$\{0,1}FileVersion:'
syn match ThorBodyInlineField '$\{0,1}FilterRTID:'
syn match ThorBodyInlineField '$\{0,1}FWLink:'
syn match ThorBodyInlineField '$\{0,1}GrantedAccess:'
syn match ThorBodyInlineField '$\{0,1}HandleId:'
syn match ThorBodyInlineField '$\{0,1}Hashes:'
syn match ThorBodyInlineField '$\{0,1}HomeDirectory:'
syn match ThorBodyInlineField '$\{0,1}HomePath:'
syn match ThorBodyInlineField '$\{0,1}Image:'
syn match ThorBodyInlineField '$\{0,1}ImagePath:'
syn match ThorBodyInlineField '$\{0,1}ImpersonationLevel:'
syn match ThorBodyInlineField '$\{0,1}IntegrityLevel:'
syn match ThorBodyInlineField '$\{0,1}IoSize:'
syn match ThorBodyInlineField '$\{0,1}IoType:'
syn match ThorBodyInlineField '$\{0,1}IpAddress:'
syn match ThorBodyInlineField '$\{0,1}IpPort:'
syn match ThorBodyInlineField '$\{0,1}IsBootVolume:'
syn match ThorBodyInlineField '$\{0,1}KeyLength:'
syn match ThorBodyInlineField '$\{0,1}Keywords:'
syn match ThorBodyInlineField '$\{0,1}LatencyMs:'
syn match ThorBodyInlineField '$\{0,1}LayerName:'
syn match ThorBodyInlineField '$\{0,1}LayerRTID:'
syn match ThorBodyInlineField '$\{0,1}Level:'
syn match ThorBodyInlineField '$\{0,1}LmPackageName:'
syn match ThorBodyInlineField '$\{0,1}LogonGuid:'
syn match ThorBodyInlineField '$\{0,1}LogonHours:'
syn match ThorBodyInlineField '$\{0,1}LogonId:'
syn match ThorBodyInlineField '$\{0,1}LogonProcessName:'
syn match ThorBodyInlineField '$\{0,1}LogonType:'
syn match ThorBodyInlineField '$\{0,1}MandatoryLabel:'
syn match ThorBodyInlineField '$\{0,1}MasterKeyId:'
syn match ThorBodyInlineField '$\{0,1}MaxLatencyMs:'
syn match ThorBodyInlineField '$\{0,1}MessageNumber:'
syn match ThorBodyInlineField '$\{0,1}MessageTotal:'
syn match ThorBodyInlineField '$\{0,1}NewProcessId:'
syn match ThorBodyInlineField '$\{0,1}NewProcessName:'
syn match ThorBodyInlineField '$\{0,1}NewTime:'
syn match ThorBodyInlineField '$\{0,1}NewUacValue:'
syn match ThorBodyInlineField '$\{0,1}ObjectClass:'
syn match ThorBodyInlineField '$\{0,1}ObjectDN:'
syn match ThorBodyInlineField '$\{0,1}ObjectGUID:'
syn match ThorBodyInlineField '$\{0,1}ObjectName:'
syn match ThorBodyInlineField '$\{0,1}ObjectServer:'
syn match ThorBodyInlineField '$\{0,1}ObjectType:'
syn match ThorBodyInlineField '$\{0,1}OldUacValue:'
syn match ThorBodyInlineField '$\{0,1}Opcode:'
syn match ThorBodyInlineField '$\{0,1}OpCorrelationID:'
syn match ThorBodyInlineField '$\{0,1}OperationType:'
syn match ThorBodyInlineField '$\{0,1}Origin\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Origin\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}OriginalFileName:'
syn match ThorBodyInlineField '$\{0,1}PackageName:'
syn match ThorBodyInlineField '$\{0,1}ParentCommandLine:'
syn match ThorBodyInlineField '$\{0,1}ParentImage:'
syn match ThorBodyInlineField '$\{0,1}ParentProcessGuid:'
syn match ThorBodyInlineField '$\{0,1}ParentProcessId:'
syn match ThorBodyInlineField '$\{0,1}ParentProcessName:'
syn match ThorBodyInlineField '$\{0,1}PasswordLastSet:'
syn match ThorBodyInlineField '$\{0,1}Path:'
syn match ThorBodyInlineField '$\{0,1}PersistentFID:'
syn match ThorBodyInlineField '$\{0,1}Post\s\{,1}Clean\s\{,1}Status:'
syn match ThorBodyInlineField '$\{0,1}Pre\s\{,1}Execution\s\{,1}Status:'
syn match ThorBodyInlineField '$\{0,1}PreviousTime:'
syn match ThorBodyInlineField '$\{0,1}PrimaryGroupId:'
syn match ThorBodyInlineField '$\{0,1}PrivilegeList:'
syn match ThorBodyInlineField '$\{0,1}Process:'
syn match ThorBodyInlineField '$\{0,1}ProcessI[Dd]:'
syn match ThorBodyInlineField '$\{0,1}ProcessGuid:'
syn match ThorBodyInlineField '$\{0,1}ProcessName:'
syn match ThorBodyInlineField '$\{0,1}Process\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}Product:'
syn match ThorBodyInlineField '$\{0,1}Product\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}Product\s\{,1}Version:'
syn match ThorBodyInlineField '$\{0,1}ProfilePath:'
syn match ThorBodyInlineField '$\{0,1}Properties:'
syn match ThorBodyInlineField '$\{0,1}Protocol:'
syn match ThorBodyInlineField '$\{0,1}Provider.Guid:'
syn match ThorBodyInlineField '$\{0,1}Provider.Name:'
syn match ThorBodyInlineField '$\{0,1}Provider_Name:'
syn match ThorBodyInlineField '$\{0,1}RecoveryKeyId:'
syn match ThorBodyInlineField '$\{0,1}RecoveryServer:'
syn match ThorBodyInlineField '$\{0,1}RelativeTargetName:'
syn match ThorBodyInlineField '$\{0,1}Remediation\s\{,1}User:'
syn match ThorBodyInlineField '$\{0,1}RemoteMachineID:'
syn match ThorBodyInlineField '$\{0,1}RemoteUserID:'
syn match ThorBodyInlineField '$\{0,1}ResilientHandle:'
syn match ThorBodyInlineField '$\{0,1}ResourceAttributes:'
syn match ThorBodyInlineField '$\{0,1}RestrictedAdminMode:'
syn match ThorBodyInlineField '$\{0,1}RestrictedSidCount:'
syn match ThorBodyInlineField '$\{0,1}ResumeKey:'
syn match ThorBodyInlineField '$\{0,1}RuleName:'
syn match ThorBodyInlineField '$\{0,1}SamAccountName:'
syn match ThorBodyInlineField '$\{0,1}ScriptBlockText:'
syn match ThorBodyInlineField '$\{0,1}ScriptPath:'
syn match ThorBodyInlineField '$\{0,1}Security\s\{,1}intelligence\s\{,1}Version:'
syn match ThorBodyInlineField '$\{0,1}Security.UserID:'
syn match ThorBodyInlineField '$\{0,1}ServiceName:'
syn match ThorBodyInlineField '$\{0,1}ServicePrincipalNames:'
syn match ThorBodyInlineField '$\{0,1}ServiceType:'
syn match ThorBodyInlineField '$\{0,1}Severity\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Severity\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}SidHistory:'
syn match ThorBodyInlineField '$\{0,1}Signature\s\{,1}Version:'
syn match ThorBodyInlineField '$\{0,1}ShareLocalPath:'
syn match ThorBodyInlineField '$\{0,1}ShareName:'
syn match ThorBodyInlineField '$\{0,1}ShareNameLength:'
syn match ThorBodyInlineField '$\{0,1}SourceAddress:'
syn match ThorBodyInlineField '$\{0,1}SourceImage:'
syn match ThorBodyInlineField '$\{0,1}SourcePort:'
syn match ThorBodyInlineField '$\{0,1}SourceProcessGUID:'
syn match ThorBodyInlineField '$\{0,1}SourceProcessId:'
syn match ThorBodyInlineField '$\{0,1}SourceThreadId:'
syn match ThorBodyInlineField '$\{0,1}Source\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Source\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}State:'
syn match ThorBodyInlineField '$\{0,1}Status:'
syn match ThorBodyInlineField '$\{0,1}Status\s\{,1}Code:'
syn match ThorBodyInlineField '$\{0,1}Status\s\{,1}Description:'
syn match ThorBodyInlineField '$\{0,1}StartType:'
syn match ThorBodyInlineField '$\{0,1}Str\d\{1,2}:'
syn match ThorBodyInlineField '$\{0,1}SubcategoryGuid:'
syn match ThorBodyInlineField '$\{0,1}SubcategoryId:'
syn match ThorBodyInlineField '$\{0,1}SubjectDomainName:'
syn match ThorBodyInlineField '$\{0,1}SubjectLogonId:'
syn match ThorBodyInlineField '$\{0,1}SubjectUserName:'
syn match ThorBodyInlineField '$\{0,1}SubjectUserSid:'
syn match ThorBodyInlineField '$\{0,1}SubStatus:'
syn match ThorBodyInlineField '$\{0,1}TableIndex:'
syn match ThorBodyInlineField '$\{0,1}TargetDomainName:'
syn match ThorBodyInlineField '$\{0,1}TargetImage:'
syn match ThorBodyInlineField '$\{0,1}TargetLinkedLogonId:'
syn match ThorBodyInlineField '$\{0,1}TargetLogonId:'
syn match ThorBodyInlineField '$\{0,1}TargetObject:'
syn match ThorBodyInlineField '$\{0,1}TargetOutboundDomainName:'
syn match ThorBodyInlineField '$\{0,1}TargetOutboundUserName:'
syn match ThorBodyInlineField '$\{0,1}TargetProcessGUID:'
syn match ThorBodyInlineField '$\{0,1}TargetProcessId:'
syn match ThorBodyInlineField '$\{0,1}TargetSid:'
syn match ThorBodyInlineField '$\{0,1}TargetUserName:'
syn match ThorBodyInlineField '$\{0,1}TargetUserSid:'
syn match ThorBodyInlineField '$\{0,1}Task:'
syn match ThorBodyInlineField '$\{0,1}TaskInstanceId:'
syn match ThorBodyInlineField '$\{0,1}TaskName:'
syn match ThorBodyInlineField '$\{0,1}TerminalSessionId:'
syn match ThorBodyInlineField '$\{0,1}Threat\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Threat\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}TimeCreated.SystemTime:'
syn match ThorBodyInlineField '$\{0,1}TokenElevationType:'
syn match ThorBodyInlineField '$\{0,1}TransactionId:'
syn match ThorBodyInlineField '$\{0,1}TransmittedServices:'
syn match ThorBodyInlineField '$\{0,1}Type\s\{,1}ID:'
syn match ThorBodyInlineField '$\{0,1}Type\s\{,1}Name:'
syn match ThorBodyInlineField '$\{0,1}Unused\d\?:'
syn match ThorBodyInlineField '$\{0,1}User:'
syn match ThorBodyInlineField '$\{0,1}UserAccountControl:'
syn match ThorBodyInlineField '$\{0,1}UserParameters:'
syn match ThorBodyInlineField '$\{0,1}UserPrincipalName:'
syn match ThorBodyInlineField '$\{0,1}UserWorkstations:'
syn match ThorBodyInlineField '$\{0,1}UtcTime:'
syn match ThorBodyInlineField '$\{0,1}Version:'
syn match ThorBodyInlineField '$\{0,1}VirtualAccount:'
syn match ThorBodyInlineField '$\{0,1}VolatileFID:'
syn match ThorBodyInlineField '$\{0,1}VolumeCorrelationId:'
syn match ThorBodyInlineField '$\{0,1}VolumeName:'
syn match ThorBodyInlineField '$\{0,1}VolumeNameLength:'
syn match ThorBodyInlineField '$\{0,1}Workstation:'
syn match ThorBodyInlineField '$\{0,1}WorkstationName:'

" set colors
highlight ThorBodyField ctermfg=cyan
highlight ThorBodyInlineField ctermfg=green
highlight ThorHash ctermfg=magenta
highlight ThorImportant ctermfg=red
highlight ThorIp ctermfg=green
highlight ThorMessage ctermfg=yellow
highlight ThorModule ctermfg=brown
highlight ThorScanid ctermfg=blue
highlight ThorFilename ctermfg=yellow
highlight ThorHighScore ctermfg=red

let b:current_syntax = "thor"
