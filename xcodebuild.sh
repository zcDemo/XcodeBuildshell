
#注意：脚本目录和WorkSpace目录在同一个目录
#工程名字(Target名字)
Project_Name="hnc-ios"
#workspace的名字
Workspace_Name="hnc-ios"
#配置环境，Release或者Debug,默认release
Configuration="Release"


echo "选择打包方式(输入序号)"
echo "1 appStore"
echo "2 ad-hot"
echo "3 development"

# 读取用户输入并存到变量里
read parameter
sleep 0.5
method="$parameter"

# 判读用户是否有输入
if [ -n "$method" ]
then
    if [ "$method" = "1" ]
    then
	xcodebuild archive -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath ~/Desktop/$Project_Name.xcarchive
	xcodebuild -exportArchive -archivePath ~/Desktop/$Project_Name.xcarchive -exportOptionsPlist ~/Desktop/exportOptionPlist/AppStoreExportOptionsPlist.plist -exportPath ~/Desktop/$Project_Name.ipa
    elif [ "$method" = "2" ]
    then
	xcodebuild  archive -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath ~/Desktop/$Project_Name.xcarchive
	xcodebuild -exportArchive -archivePath ~/Desktop/$Project_Name.xcarchive -exportOptionsPlist ~/Desktop/exportOptionPlist/ADHOCExportOptionsPlist.plist -exportPath ~/Desktop/$Project_Name.ipa
    elif [ "$method" = "3" ]
    then
    xcodebuild archive -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath ~/Desktop/$Project_Name.xcarchive
    xcodebuild -exportArchive -archivePath ~/Desktop/$Project_Name.xcarchive -exportOptionsPlist ~/Desktop/$Project_Name.xcarchive/Info.plist -exportPath ~/Desktop/$Project_Name.ipa
    else
    echo "参数无效....$method"
    exit 1
    fi
fi
