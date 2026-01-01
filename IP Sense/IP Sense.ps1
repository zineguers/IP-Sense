Add-Type -AssemblyName PresentationFramework, System.Windows.Forms, System.Drawing

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="SOC Pro v9" Height="680" Width="500" WindowStyle="None" 
        AllowsTransparency="True" Background="Transparent" WindowStartupLocation="CenterScreen">

    <Window.Resources>
        <SolidColorBrush x:Key="BgBase" Color="#0D1117"/>
        <SolidColorBrush x:Key="BgSurface" Color="#161B22"/>
        <SolidColorBrush x:Key="BorderDefault" Color="#30363D"/>
        <SolidColorBrush x:Key="TextMain" Color="#C9D1D9"/>
        <SolidColorBrush x:Key="LinkBlue" Color="#58A6FF"/>

        <Style x:Key="GithubBtn" TargetType="Button">
            <Setter Property="Background" Value="#21262D"/>
            <Setter Property="Foreground" Value="#C9D1D9"/>
            <Setter Property="BorderBrush" Value="#30363D"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Padding" Value="12,6"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="6">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center" Margin="{TemplateBinding Padding}"/>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="#30363D"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <Style x:Key="PrimaryBtn" TargetType="Button" BasedOn="{StaticResource GithubBtn}">
            <Setter Property="Background" Value="#238636"/>
            <Setter Property="Foreground" Value="White"/>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="#2EA043"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <Style x:Key="SubtleBtn" TargetType="Button">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Foreground" Value="#8B949E"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <TextBlock Text="{TemplateBinding Content}" Background="Transparent" Padding="4"/>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Foreground" Value="#F85149"/> 
                </Trigger>
            </Style.Triggers>
        </Style>

        <Style x:Key="FooterActionBtn" TargetType="Button">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Foreground" Value="{StaticResource LinkBlue}"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Padding" Value="4"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <TextBlock Text="{TemplateBinding Content}" Background="Transparent" Padding="{TemplateBinding Padding}"/>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Foreground" Value="White"/>
                </Trigger>
            </Style.Triggers>
        </Style>
    </Window.Resources>

    <!-- Opening Animation Triggers (moved to correct Window level) -->
    <Window.Triggers>
        <EventTrigger RoutedEvent="Window.Loaded">
            <BeginStoryboard>
                <Storyboard>
                    <DoubleAnimation
                        Storyboard.TargetName="MainCard"
                        Storyboard.TargetProperty="Opacity"
                        From="0" To="1" Duration="0:0:1" BeginTime="0:0:0.1">
                        <DoubleAnimation.EasingFunction>
                            <CubicEase EasingMode="EaseOut"/>
                        </DoubleAnimation.EasingFunction>
                    </DoubleAnimation>
                    <DoubleAnimation
                        Storyboard.TargetName="MainCard"
                        Storyboard.TargetProperty="(UIElement.RenderTransform).(TransformGroup.Children)[0].(TranslateTransform.Y)"
                        From="40" To="0" Duration="0:0:0.8">
                        <DoubleAnimation.EasingFunction>
                            <QuarticEase EasingMode="EaseOut"/>
                        </DoubleAnimation.EasingFunction>
                    </DoubleAnimation>
                    <DoubleAnimation
                        Storyboard.TargetName="MainCard"
                        Storyboard.TargetProperty="(UIElement.RenderTransform).(TransformGroup.Children)[1].(ScaleTransform.ScaleX)"
                        From="0.92" To="1" Duration="0:0:0.8">
                        <DoubleAnimation.EasingFunction>
                            <QuarticEase EasingMode="EaseOut"/>
                        </DoubleAnimation.EasingFunction>
                    </DoubleAnimation>
                    <DoubleAnimation
                        Storyboard.TargetName="MainCard"
                        Storyboard.TargetProperty="(UIElement.RenderTransform).(TransformGroup.Children)[1].(ScaleTransform.ScaleY)"
                        From="0.92" To="1" Duration="0:0:0.8">
                        <DoubleAnimation.EasingFunction>
                            <QuarticEase EasingMode="EaseOut"/>
                        </DoubleAnimation.EasingFunction>
                    </DoubleAnimation>
                </Storyboard>
            </BeginStoryboard>
        </EventTrigger>
    </Window.Triggers>

    <Border Name="MainCard" Background="{StaticResource BgBase}" CornerRadius="12" BorderBrush="{StaticResource BorderDefault}" BorderThickness="1" Opacity="0">
        <Border.Effect>
            <DropShadowEffect Color="Black" Direction="270" ShadowDepth="10" BlurRadius="24" Opacity="0.5"/>
        </Border.Effect>
        <Border.RenderTransform>
            <TransformGroup>
                <TranslateTransform Y="40"/>
                <ScaleTransform ScaleX="0.92" ScaleY="0.92" CenterX="0.5" CenterY="0.5"/>
            </TransformGroup>
        </Border.RenderTransform>

        <Grid Margin="24">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>

            <Grid Grid.Row="0" Margin="0,0,0,24">
                <StackPanel HorizontalAlignment="Left">
                    <TextBlock Text="[IP Sense]" Foreground="White" FontSize="22" FontWeight="Bold"/>
                    <TextBlock Name="ThreatStatus" Text="Ready to fetch intel" Foreground="#8B949E" FontSize="13" Margin="0,4,0,0"/>
                </StackPanel>
                <Button Name="ExitBtn" Content="Exit" Style="{StaticResource SubtleBtn}" HorizontalAlignment="Right" VerticalAlignment="Top" Cursor="Hand" FontSize="12"/>
            </Grid>

            <StackPanel Grid.Row="1" Margin="0,0,0,20">
                <TextBlock Text="Target IP Addresses (comma separated, max 20)" Foreground="#8B949E" FontSize="11" FontWeight="Bold" Margin="0,0,0,8"/>
                <TextBox Name="IpEntry" Height="36" Background="#0D1117" Foreground="White" BorderBrush="#30363D" Padding="10,6" FontSize="14" BorderThickness="1">
                    <TextBox.Resources><Style TargetType="{x:Type Border}"><Setter Property="CornerRadius" Value="6"/></Style></TextBox.Resources>
                </TextBox>
                
                <StackPanel Orientation="Horizontal" Margin="0,12,0,0">
                    <Button Name="ScanBtn" Content="Run Scan" Style="{StaticResource PrimaryBtn}" Width="90"/>
                    <Button Name="ClearBtn" Content="Reset" Style="{StaticResource GithubBtn}" Width="80" Margin="10,0,0,0"/>
                    <Button Name="WhoisBtn" Content="Intel" Style="{StaticResource GithubBtn}" Width="80" Margin="10,0,0,0"/>
                    <Button Name="AbuseBtn" Content="AbuseIP" Style="{StaticResource GithubBtn}" Width="80" Margin="10,0,0,0"/>
                    <Button Name="HistoryBtn" Content="History" Style="{StaticResource GithubBtn}" Width="80" Margin="10,0,0,0"/>
                </StackPanel>
            </StackPanel>

            <Border Grid.Row="2" Background="{StaticResource BgSurface}" CornerRadius="6" BorderBrush="{StaticResource BorderDefault}" BorderThickness="1">
                <ScrollViewer Name="OutputScroll" VerticalScrollBarVisibility="Auto" Padding="16">
                    <TextBlock Name="Monitor" Foreground="{StaticResource TextMain}" FontFamily="Consolas" FontSize="13" TextWrapping="Wrap" LineHeight="22"/>
                </ScrollViewer>
            </Border>

            <Grid Grid.Row="3" Margin="0,20,0,0">
                <StackPanel Orientation="Horizontal" HorizontalAlignment="Left" VerticalAlignment="Center">
                    <StackPanel>
                        <Button Name="CopyBtn" Content="Copy Raw" Style="{StaticResource FooterActionBtn}"/>
                        <TextBlock Name="CopyFeedback" Text="" Foreground="#238636" FontSize="12" HorizontalAlignment="Center" Margin="0,6,0,0"/>
                    </StackPanel>
                    <Button Name="PingBtn" Content="Ping" Style="{StaticResource FooterActionBtn}" Margin="40,0,0,0"/>
                </StackPanel>
                <StackPanel HorizontalAlignment="Right" VerticalAlignment="Center">
                    <TextBlock Text="System Operationnel" Foreground="#238636" FontSize="11" FontWeight="SemiBold" HorizontalAlignment="Right"/>
                    <TextBlock Text="Brand Name Here" Foreground="#8B949E" FontSize="10" FontStyle="Italic" FontWeight="SemiBold" HorizontalAlignment="Right"/>
                </StackPanel>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

# Load the window - this should now succeed without parsing errors
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Now find all named elements (these will no longer be null)
$IpEntry = $window.FindName("IpEntry")
$Monitor = $window.FindName("Monitor")
$Status = $window.FindName("ThreatStatus")
$OutputScroll = $window.FindName("OutputScroll")
$CopyFeedback = $window.FindName("CopyFeedback")

$script:feedbackTimer = $null

$HistoryPath = "C:\TEMP\IP Sense"
if (-not (Test-Path $HistoryPath)) {
    New-Item -Path $HistoryPath -ItemType Directory | Out-Null
}
$HistoryFile = Join-Path $HistoryPath "history.txt"

function Add-ToHistory {
    param([string]$IP)
    $tz = [System.TimeZoneInfo]::FindSystemTimeZoneById("Eastern Standard Time")
    $estTime = [System.TimeZoneInfo]::ConvertTimeFromUtc((Get-Date).ToUniversalTime(), $tz)
    $timestamp = $estTime.ToString("yyyy-MM-dd HH:mm:ss")
    $line = "$timestamp | $IP"
    Add-Content -Path $HistoryFile -Value $line
}

function Get-History {
    if (Test-Path $HistoryFile) {
        Get-Content -Path $HistoryFile | Sort-Object -Descending
    } else {
        @()
    }
}

function Get-RiskScore {
    param($data)
    $score = 0
    if ($data.proxy) { $score += 40 }
    if ($data.hosting) { $score += 20 }
    if ($data.mobile) { $score -= 10 }
    $score = [Math]::Max(0, [Math]::Min(100, $score))
    return $score
}

function Scan-IP {
    param([string]$Target)

    if ($Target -notmatch "^\d{1,3}(\.\d{1,3}){3}$") { 
        $invalidRun = New-Object System.Windows.Documents.Run "[$Target] : Invalid IPv4 format`n`n" -Property @{ Foreground = "#F85149"; FontWeight = "Bold" }
        $Monitor.Inlines.Add($invalidRun)
        $OutputScroll.ScrollToEnd()
        return
    }
    
    try {
        $data = Invoke-RestMethod -Uri "http://ip-api.com/json/$($Target)?fields=66846719"
        if ($data.status -eq "success") {
            $entryRun = New-Object System.Windows.Documents.Run "`n[ENTRY: $Target]`n`n" -Property @{ Foreground = "#58A6FF"; FontWeight = "Bold" }
            $Monitor.Inlines.Add($entryRun)

            $Monitor.Inlines.Add("IP        : $($data.query)`n")
            $Monitor.Inlines.Add("ASN       : $($data.as)`n")
            $Monitor.Inlines.Add("ISP       : $($data.isp)`n")
            $Monitor.Inlines.Add("ORG       : $($data.org)`n")
            $Monitor.Inlines.Add("LOCATION  : $($data.city), $($data.regionName), $($data.country)`n")
            $Monitor.Inlines.Add("LAT/LON   : $($data.lat), $($data.lon)`n")

            $proxyStr = if($data.proxy) { "YES" } else { "NO" }
            $proxyRun = New-Object System.Windows.Documents.Run "PROXY/VPN : $proxyStr`n"
            if ($data.proxy) { $proxyRun = New-Object System.Windows.Documents.Run "PROXY/VPN : $proxyStr`n" -Property @{ Foreground = "#F85149"; FontWeight = "Bold" } }
            $Monitor.Inlines.Add($proxyRun)

            $score = Get-RiskScore -data $data
            $riskColor = if ($score -gt 60) { "#F85149" } elseif ($score -gt 30) { "#FF8800" } else { "#238636" }
            $riskRun = New-Object System.Windows.Documents.Run "RISK LEVEL: $score%`n`n" -Property @{ Foreground = $riskColor; FontWeight = "SemiBold" }
            $Monitor.Inlines.Add($riskRun)

            $sepRun = New-Object System.Windows.Documents.Run "--------------------------------------`n" -Property @{ Foreground = "#484F58" }
            $Monitor.Inlines.Add($sepRun)

            $OutputScroll.ScrollToEnd()
        } else {
            $failRun = New-Object System.Windows.Documents.Run "[$Target] : API returned fail`n`n" -Property @{ Foreground = "#F85149"; FontWeight = "Bold" }
            $Monitor.Inlines.Add($failRun)
            $OutputScroll.ScrollToEnd()
        }
    } catch {
        $errorRun = New-Object System.Windows.Documents.Run "[$Target] : Connection error`n`n" -Property @{ Foreground = "#F85149"; FontWeight = "Bold" }
        $Monitor.Inlines.Add($errorRun)
        $OutputScroll.ScrollToEnd()
    }
}

$window.FindName("ScanBtn").Add_Click({
    $Inputs = $IpEntry.Text.Split(',').Trim() | Where-Object { $_ -ne "" } | Select-Object -Unique
    
    if ($Inputs.Count -gt 20) { 
        $Status.Text = "Limit exceeded (Max 20)"; $Status.Foreground = "#F85149"; return
    }
    if ($Inputs.Count -eq 0) { return }

    $Monitor.Inlines.Clear()
    $Status.Text = "Scanning $($Inputs.Count) targets..."; $Status.Foreground = "#58A6FF"

    foreach ($Target in $Inputs) {
        Scan-IP -Target $Target
        Add-ToHistory -IP $Target
    }

    $Status.Text = "Scan finished"; $Status.Foreground = "#238636"
    $OutputScroll.ScrollToEnd()
})

$window.FindName("HistoryBtn").Add_Click({
    $historyLines = Get-History
    if ($historyLines.Count -eq 0) {
        [System.Windows.MessageBox]::Show("No scan history yet.", "History", "OK", "Information") | Out-Null
        return
    }

    $historyWindow = New-Object System.Windows.Window
    $historyWindow.Title = "Scan History"
    $historyWindow.Width = 480
    $historyWindow.Height = 600
    $historyWindow.WindowStyle = "None"
    $historyWindow.AllowsTransparency = $true
    $historyWindow.Background = "#0D1117"
    $historyWindow.Foreground = "#C9D1D9"
    $historyWindow.WindowStartupLocation = "CenterOwner"
    $historyWindow.Owner = $window

    $border = New-Object System.Windows.Controls.Border
    $border.Background = "#0D1117"
    $border.CornerRadius = 12
    $border.BorderBrush = "#30363D"
    $border.BorderThickness = 1
    $border.Padding = 24

    $grid = New-Object System.Windows.Controls.Grid
    $grid.RowDefinitions.Add((New-Object System.Windows.Controls.RowDefinition -Property @{Height="Auto"}))
    $grid.RowDefinitions.Add((New-Object System.Windows.Controls.RowDefinition -Property @{Height="*"}))
    $grid.RowDefinitions.Add((New-Object System.Windows.Controls.RowDefinition -Property @{Height="Auto"}))

    $header = New-Object System.Windows.Controls.Grid
    $header.Margin = New-Object System.Windows.Thickness(0,0,0,20)

    $title = New-Object System.Windows.Controls.TextBlock
    $title.Text = "Scan History"
    $title.FontSize = 20
    $title.FontWeight = "Bold"
    $title.Foreground = "White"

    $close = New-Object System.Windows.Controls.Button
    $close.Content = "x"
    $close.FontSize = 24
    $close.FontWeight = "Bold"
    $close.Background = "Transparent"
    $close.Foreground = "#BE254E"
    $close.BorderThickness = 0
    $close.HorizontalAlignment = "Right"
    $close.Cursor = "Hand"
    $close.Add_Click({ $historyWindow.Close() })

    $header.Children.Add($title)
    $header.Children.Add($close)

    $listView = New-Object System.Windows.Controls.ListView
    $listView.Background = "#161B22"
    $listView.BorderBrush = "#30363D"
    $listView.BorderThickness = 1
    $listView.Foreground = "#FFD700"
    $listView.FontFamily = "Consolas"
    $listView.FontSize = 13
    $listView.Margin = New-Object System.Windows.Thickness(0,0,0,10)

    $column = New-Object System.Windows.Controls.GridViewColumn
    $column.Header = "Timestamp | IP"
    $column.Width = 420
    $column.DisplayMemberBinding = New-Object System.Windows.Data.Binding

    $gridView = New-Object System.Windows.Controls.GridView
    $gridView.Columns.Add($column)
    $listView.View = $gridView

    foreach ($line in $historyLines) {
        $listView.Items.Add($line) | Out-Null
    }

    $listView.Add_MouseDoubleClick({
        if ($listView.SelectedItem) {
            $selected = $listView.SelectedItem.ToString().Split('|')[1].Trim()
            $historyWindow.Close()
            $IpEntry.Text = $selected
            $Monitor.Inlines.Clear()
            $Status.Text = "Scanning from history..."
            $Status.Foreground = "#58A6FF"
            Scan-IP -Target $selected
            Add-ToHistory -IP $selected
            $Status.Text = "Scan finished"
            $Status.Foreground = "#238636"
        }
    })

    $clearBtn = New-Object System.Windows.Controls.Button
    $clearBtn.Content = "Clear History"
    $clearBtn.Background = "#21262D"
    $clearBtn.Foreground = "#F85149"
    $clearBtn.BorderBrush = "#30363D"
    $clearBtn.BorderThickness = 1
    $clearBtn.Padding = "12,8"
    $clearBtn.HorizontalAlignment = "Center"
    $clearBtn.Cursor = "Hand"
    $clearBtn.Add_Click({
        if ([System.Windows.MessageBox]::Show("Clear all history?", "Confirm", "YesNo", "Warning") -eq "Yes") {
            if (Test-Path $HistoryFile) { Remove-Item $HistoryFile }
            $historyWindow.Close()
        }
    })

    [System.Windows.Controls.Grid]::SetRow($header, 0)
    [System.Windows.Controls.Grid]::SetRow($listView, 1)
    [System.Windows.Controls.Grid]::SetRow($clearBtn, 2)

    $grid.Children.Add($header)
    $grid.Children.Add($listView)
    $grid.Children.Add($clearBtn)

    $border.Child = $grid
    $historyWindow.Content = $border

    $historyWindow.Add_MouseLeftButtonDown({ $historyWindow.DragMove() })
    $historyWindow.ShowDialog() | Out-Null
})

$window.FindName("ClearBtn").Add_Click({ 
    $IpEntry.Text = ""; 
    $Monitor.Inlines.Clear(); 
    $Status.Text = "Ready"; 
    $Status.Foreground = "#8B949E" 
})

$window.FindName("WhoisBtn").Add_Click({ 
    $firstIp = $IpEntry.Text.Split(',')[0].Trim()
    if ($firstIp) { Start-Process "https://www.brightcloud.com/tools/url-ip-lookup.php?ip=$firstIp" }
})

$window.FindName("AbuseBtn").Add_Click({ 
    $firstIp = $IpEntry.Text.Split(',')[0].Trim()
    if ($firstIp) { Start-Process "https://www.abuseipdb.com/check/$firstIp" }
})

$window.FindName("CopyBtn").Add_Click({
    if ($Monitor.Text) { 
        [System.Windows.Clipboard]::SetText($Monitor.Text)
        $CopyFeedback.Text = "Copied!"

        if ($script:feedbackTimer -and $script:feedbackTimer.IsEnabled) {
            $script:feedbackTimer.Stop()
        }

        $script:feedbackTimer = New-Object System.Windows.Threading.DispatcherTimer
        $script:feedbackTimer.Interval = [TimeSpan]::FromSeconds(2)
        $script:feedbackTimer.Add_Tick({
            $CopyFeedback.Text = ""
            $script:feedbackTimer.Stop()
        })
        $script:feedbackTimer.Start()
    }
})

$window.FindName("PingBtn").Add_Click({
    $firstIp = $IpEntry.Text.Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ } | Select-Object -First 1
    if (-not $firstIp) { 
        $Status.Text = "No IP entered"
        $Status.Foreground = "#F85149"
        return 
    }

    if ($firstIp -notmatch "^\d{1,3}(\.\d{1,3}){3}$") {
        $Status.Text = "Invalid IP format"
        $Status.Foreground = "#F85149"
        return
    }

    Start-Process "cmd.exe" -ArgumentList "/k title Ping: $firstIp && ping -t $firstIp"

    $scamHeader = New-Object System.Windows.Documents.Run "`n=== Scamalytics Risk Assessment for $firstIp ===`n" -Property @{ Foreground = "#58A6FF"; FontWeight = "Bold" }
    $Monitor.Inlines.Add($scamHeader)
    
    try {
        $resp = Invoke-WebRequest -Uri "https://scamalytics.com/ip/$firstIp" -UseBasicParsing -TimeoutSec 10
        $content = $resp.Content

        if ($content -match 'Fraud Score:\s*(\d+)') {
            $score = [int]$matches[1]
            $verdict = switch ($score) {
                { $_ -le 25 } { "Benign" }
                { $_ -le 75 } { "Suspicious" }
                default { "Malicious" }
            }
            $verdictColor = switch ($score) {
                { $_ -le 25 } { "#238636" }
                { $_ -le 75 } { "#FF8800" }
                default { "#F85149" }
            }

            $Monitor.Inlines.Add("Risk Score: $score`n")
            $verdictRun = New-Object System.Windows.Documents.Run "Final Verdict: $verdict`n`n" -Property @{ Foreground = $verdictColor; FontWeight = "Bold" }
            $Monitor.Inlines.Add($verdictRun)
        } else {
            $Monitor.Inlines.Add("Risk Score: Not available`nFinal Verdict: Unknown`n`n")
        }
    } catch {
        $errorRun = New-Object System.Windows.Documents.Run "Risk Score: Error fetching data`nFinal Verdict: Unknown`n`n" -Property @{ Foreground = "#F85149" }
        $Monitor.Inlines.Add($errorRun)
    }

    $OutputScroll.ScrollToEnd()
    $Status.Text = "Ping opened + Risk checked"
    $Status.Foreground = "#238636"
})

$window.FindName("ExitBtn").Add_Click({ $window.Close() })
$window.Add_MouseLeftButtonDown({ $window.DragMove() })

# Show the window with the smooth animation
$window.ShowDialog() | Out-Null