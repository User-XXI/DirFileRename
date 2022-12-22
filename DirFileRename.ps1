$path = "<PATH>"
Set-Location $path

ForEach($TempObjectInPath in Get-ChildItem){
    Set-Location $TempObjectInPath

    ForEach($TempObjectInNEWPath in Get-ChildItem){
        $TempObjectInNEWPath = [string]($TempObjectInNEWPath.Name)

        if($TempObjectInNEWPath.IndexOf(".") -gt 1){
            $StartIndex = $TempObjectInNEWPath.IndexOf(".")
            $TempType = $TempObjectInNEWPath.Substring($StartIndex)
        }
        else{ 
            $TempType = ""
        }

        [string]($NewName) = [string]($TempObjectInPath) + [string]($TempType)
        Rename-Item -Path  $TempObjectInNEWPath -NewName $NewName
        Get-ChildItem -File $NewName | Move-Item -Destination ..
    }
    $NewName = ""
    Set-Location ..
}
EXIT
