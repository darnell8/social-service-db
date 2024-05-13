for /l %%C in (1,1,9) do (
    for /l %%N in (1,1,9) do (
        set "files_found=false"
        for /f "delims=" %%i in ('dir /b /s /a-d ^| findstr /r "163.*%%C-.*_part%%N.*"') do (
            git add "%%i"
            set "files_found=true"
        )
        if %files_found%==true (
            git commit -m "✨ feat: 增加2016.04-163mail数据%%C-%%N"
        )
    )
)