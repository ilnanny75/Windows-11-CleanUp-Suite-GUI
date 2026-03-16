Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Windows 11 CleanUp Suite - v1.1"
$form.Size = New-Object System.Drawing.Size(600, 520)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 25)
$form.ForeColor = [System.Drawing.Color]::White
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

$fontTitolo = New-Object System.Drawing.Font("Segoe UI Variable Display", 18, [System.Drawing.FontStyle]::Bold)
$fontTesto = New-Object System.Drawing.Font("Segoe UI", 10)

$lblTitle = New-Object System.Windows.Forms.Label
$lblTitle.Text = "CleanUp Suite"
$lblTitle.Location = New-Object System.Drawing.Point(20, 20)
$lblTitle.Size = New-Object System.Drawing.Size(540, 40)
$lblTitle.Font = $fontTitolo
$lblTitle.TextAlign = "MiddleCenter"
$lblTitle.ForeColor = [System.Drawing.Color]::FromArgb(0, 153, 255)
$form.Controls.Add($lblTitle)

$logBox = New-Object System.Windows.Forms.RichTextBox
$logBox.Location = New-Object System.Drawing.Point(30, 230)
$logBox.Size = New-Object System.Drawing.Size(525, 180)
$logBox.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$logBox.ForeColor = [System.Drawing.Color]::LightGray
$logBox.BorderStyle = "None"
$logBox.ReadOnly = $true
$form.Controls.Add($logBox)

function Write-Log($msg) {
    $logBox.AppendText("[(Get-Date -Format 'HH:mm:ss')] $msg`n")
    $logBox.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

$btnStyle = @{ FlatStyle = "Flat"; Height = 50; Width = 160; ForeColor = "White"; Font = "Segoe UI Semibold, 10" }

$btnTemp = New-Object System.Windows.Forms.Button
$btnTemp.Text = "PULIZIA BASE"
$btnTemp.Location = New-Object System.Drawing.Point(30, 90)
$btnTemp.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
foreach($k in $btnStyle.Keys){$btnTemp.$k = $btnStyle.$k}
$btnTemp.Add_Click({
    Write-Log "Esecuzione Pulizia Base..."
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Log "Completato: File Temporanei rimossi."
})

$btnDeep = New-Object System.Windows.Forms.Button
$btnDeep.Text = "PROFONDA"
$btnDeep.Location = New-Object System.Drawing.Point(212, 90)
$btnDeep.BackColor = [System.Drawing.Color]::FromArgb(0, 90, 158)
foreach($k in $btnStyle.Keys){$btnDeep.$k = $btnStyle.$k}
$btnDeep.Add_Click({
    Write-Log "Esecuzione Pulizia Profonda..."
    Remove-Item "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Get-ChildItem "C:\Windows\Logs" -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    Write-Log "Completato: Prefetch e Log eliminati."
})

$btnMax = New-Object System.Windows.Forms.Button
$btnMax.Text = "MASSIMA (DISM)"
$btnMax.Location = New-Object System.Drawing.Point(395, 90)
$btnMax.BackColor = [System.Drawing.Color]::FromArgb(180, 0, 0)
foreach($k in $btnStyle.Keys){$btnMax.$k = $btnStyle.$k}
$btnMax.Add_Click({
    $res = [System.Windows.Forms.MessageBox]::Confirm("Vuoi procedere con la manutenzione pesante?")
    Write-Log "Avvio Manutenzione Sistema (DISM/SFC)..."
    sfc /scannow
    dism /online /cleanup-image /startcomponentcleanup /resetbase
    Write-Log "Sistema Ottimizzato con Successo!"
})

$form.Controls.AddRange(@($btnTemp, $btnDeep, $btnMax))

$lblDisc = New-Object System.Windows.Forms.Label
$lblDisc.Text = "Disclaimer: Uso a proprio rischio. Creato da ilnanny75"
$lblDisc.Location = New-Object System.Drawing.Point(20, 430)
$lblDisc.Size = New-Object System.Drawing.Size(540, 30)
$lblDisc.TextAlign = "MiddleCenter"
$lblDisc.ForeColor = [System.Drawing.Color]::Gray
$form.Controls.Add($lblDisc)

$form.ShowDialog()
