function Set-WindowStyle {
  param(
    [Parameter()]
    [ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE',
                 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED',
                 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
    $Style = 'SHOW',
    [Parameter()]
    $MainWindowHandle = (Get-Process -Id $pid).MainWindowHandle
  )
  $WindowStates = @{
    FORCEMINIMIZE   = 11; HIDE            = 0
    MAXIMIZE        = 3;  MINIMIZE        = 6
    RESTORE         = 9;  SHOW            = 5
    SHOWDEFAULT     = 10; SHOWMAXIMIZED   = 3
    SHOWMINIMIZED   = 2;  SHOWMINNOACTIVE = 7
    SHOWNA          = 8;  SHOWNOACTIVATE  = 4
    SHOWNORMAL      = 1
  }
  Write-Verbose ("Set Window Style {1} on handle {0}" -f $MainWindowHandle, $($WindowStates[$style]))

  $Win32ShowWindowAsync = Add-Type -MemberDefinition @"
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@ -name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru

  $Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$Style]) | Out-Null
}

(Get-Process -Name VcXsrv).MainWindowHandle | foreach { Set-WindowStyle MAXIMIZE $_ }
