<#

Messung der Bildschirmzeit inkl. GUI

#>


#Hinzufügen der Basis der GUI
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
#Erstellung der Stoppuhr, zur Messung der Bildschirmzeit
$stopwatch = [system.diagnostics.stopwatch]::new()


#Erstellt die Haupt-/ Grundform der GUI
$newObjForm = New-Object System.Windows.Forms.Form
$newObjForm.StartPosition = "CenterScreen"
$newObjForm.Size = New-Object System.Drawing.Size(800,400)
$newObjForm.Text = "Bildschirmzeit"


#Erstellt einen Text - Status der Bildschirmzeit
$objSWatchtimeTitle = New-Object System.Windows.Forms.Label
$objSWatchtimeTitle.Location = New-Object System.Drawing.Size(10,20) 
$objSWatchtimeTitle.Size = New-Object System.Drawing.Size(700,20)
$objSWatchtimeTitle.Text = "Status der Bildschirmzeit:"
$newObjForm.Controls.Add($objSWatchtimeTitle)



#Erstellt die Funktion, für den Start-Button
function startscreentime {
    
    #Messung startet
    $stopwatch.Start()

    #Die anderen Textnachricht (Statusnachricht) wird ausgeblendet
    $objTimeDeactive.Visible = $false
    $objTimeReset.Visible = $false
    $objScreentime.Visible = $false

    #Text für Statusnachricht wird ausgegeben
    $Script:objTimeActive = New-Object System.Windows.Forms.Label
    $Script:objTimeActive.Location = New-Object System.Drawing.Size(10,40) 
    $Script:objTimeActive.Size = New-Object System.Drawing.Size(700,20) 
    $Script:objTimeActive.Text = "Die Bildschirmzeit wird aufgezeichnet."
    $Script:objTimeActive.ForeColor = "green"
    $newObjForm.Controls.Add($objTimeActive)


}

#Erstellt die Funktion, für den Stop-Button
function stopscreentime {
    
    #Stoppt die Messung
    $stopwatch.Stop()

    #Die anderen Textnachricht (Statusnachricht) wird ausgeblendet
    $objTimeActive.Visible = $false

    #Text für Statusnachricht wird ausgegeben
    $Script:objTimeDeactive = New-Object System.Windows.Forms.Label
    $Script:objTimeDeactive.Location = New-Object System.Drawing.Size(10,40) 
    $Script:objTimeDeactive.Size = New-Object System.Drawing.Size(700,20) 
    $Script:objTimeDeactive.Text = ("Die Bildschirmzeit wurde gestoppt.")
    $Script:objTimeDeactive.ForeColor = "red"
    $newObjForm.Controls.Add($objTimeDeactive)

    #Die verstrichene Zeit wird in eine Variable geschrieben
    $Script:formattime = $stopwatch.Elapsed

    #Text für Bildschirmzeit wird ausgegeben
    $Script:objScreentime = New-Object System.Windows.Forms.Label
    $Script:objScreentime.Location = New-Object System.Drawing.Size(10,130) 
    $Script:objScreentime.Size = New-Object System.Drawing.Size(700,20) 
    $Script:objScreentime.Text = "Deine Bildschirmzeit beträgt: $formattime"
    $newObjForm.Controls.Add($objScreentime)

}

#Erstellt die Funktion, für den Reset-Button
function resetscreentime {
    
    #Messung wird zurückgesetzt
    $stopwatch.Reset()

    #Die anderen Textnachricht (Statusnachricht) wird ausgeblendet
    $objTimeActive.Visible = $false
    $objTimeDeactive.Visible = $false
    $objScreentime.Visible = $false

    #Text für Statusnachricht wird ausgegeben
    $Script:objTimeReset = New-Object System.Windows.Forms.Label
    $Script:objTimeReset.Location = New-Object System.Drawing.Size(10,40) 
    $Script:objTimeReset.Size = New-Object System.Drawing.Size(700,20) 
    $Script:objTimeReset.Text = "Die Bildschirmzeit wurde zurückgesetzt."
    $Script:objTimeReset.ForeColor = "black"
    $newObjForm.Controls.Add($objTimeReset)

}


#Erstellt den Button Start und führt die Funktion "startscreentime" aus
$objButtonStart = New-Object System.Windows.Forms.Button
$objButtonStart.Location = New-Object System.Drawing.Size(80,250)
$objButtonStart.Size = New-Object System.Drawing.Size(100,50)
$objButtonStart.Text = "Start"
$objButtonStart.Add_Click{startscreentime}
$newObjForm.Controls.Add($objButtonStart)


#Erstellt den Button Stop und führt die Funktion "stopscreentime" aus
$objButtonStop = New-Object System.Windows.Forms.Button
$objButtonStop.Location = New-Object System.Drawing.Size(260,250)
$objButtonStop.Size = New-Object System.Drawing.Size(100,50)
$objButtonStop.Text = "Stop"
$objButtonStop.Add_Click{stopscreentime}
$newObjForm.Controls.Add($objButtonStop)


#Erstellt den Button Reset und führt die Funktion "resetscreentime" aus
$objButtonReset = New-Object System.Windows.Forms.Button
$objButtonReset.Location = New-Object System.Drawing.Size(440,250)
$objButtonReset.Size = New-Object System.Drawing.Size(100,50)
$objButtonReset.Text = "Reset"
$objButtonReset.Add_Click{resetscreentime}
$newObjForm.Controls.Add($objButtonReset)


#Funktion "speicherort" wird erstellt
function speicherort {

#Erstellt die Haupt-/ Grundform um den Speicherort enizugeben
$newObjFormText = New-Object System.Windows.Forms.Form
$newObjFormText.StartPosition = "CenterScreen"
$newObjFormText.Size = New-Object System.Drawing.Size(600,300)
$newObjFormText.Text = "Speicherort eingeben"


#Erstellt den Text "Speicherort eingeben"
$objSpeicherortText = New-Object System.Windows.Forms.Label
$objSpeicherortText.Location = New-Object System.Drawing.Size(100,50) 
$objSpeicherortText.Size = New-Object System.Drawing.Size(340,40)
$objSpeicherortText.Text = "Geben Sie den Speicherort des Exports ein."
$newObjFormText.Controls.Add($objSpeicherortText)

#Erstellt die Textbox, um den Speicherort einzugeben
$objTextBox = New-Object System.Windows.Forms.TextBox
$objTextBox.Location = New-Object System.Drawing.Size(100,100)
$objTextBox.Size = New-Object System.Drawing.Size(290,40)
$newObjFormText.Controls.Add($objTextBox)

#Erstellt den OK-Button, um die Eingabe zu bestätigen
$objOkButton = New-Object System.Windows.Forms.Button
$objOkButton.Location = New-Object System.Drawing.Point(420,100)
$objOkButton.Size = New-Object System.Drawing.Size(75,23)
$objOkButton.Text = 'OK'
$objOkButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$newObjFormText.AcceptButton = $objOkButton
$newObjFormText.Controls.Add($objOkButton)

#Überprüft, ob der OK-Button getätigt wurde, speichert die Eingabe (Speicherort) und führt die Funktion "exportcsv" aus
if ($result = $newObjFormText.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $Script:speicherort = $objTextBox.Text
    exportcsv
} 
}

#Erstellt die Funktion "exportcsv"
function exportcsv {
    
    #Für jede Messung wird ein Export gemacht
    $stopwatch | ForEach-Object {

    #Aktuelles Datum und Zeit wird gespeichert
    $namefile = Get-Date -Format "dd.MM.yyyy-HH.mm"
    $namefile.ToString()

    #PowerShell Cutstom Object wird erstellt, die verstrichene Zeit formatiert und exportiert
    [PSCustomObject]@{
        
        Tage = $stopwatch.Elapsed.Days
        Stunden = $stopwatch.Elapsed.Hours
        Minuten = $stopwatch.Elapsed.Minutes
        Sekunden = $stopwatch.Elapsed.Seconds
        Millisekunden = $stopwatch.Elapsed.Milliseconds

    } | Export-Csv -Path "$speicherort\Bildschirmzeit-$namefile.csv" -Encoding UTF8 -NoTypeInformation -Delimiter ";" -Append

    $successfulexport = @($objExportSuccessful = New-Object System.Windows.Forms.Label
                          $objExportSuccessful.Location = New-Object System.Drawing.Size(600,310) 
                          $objExportSuccessful.Size = New-Object System.Drawing.Size(140,20) 
                          $objExportSuccessful.Text = "Export erfolgreich"
                          $objExportSuccessful.ForeColor = "green"
                          $newObjForm.Controls.Add($objExportSuccessful)
)


}

}

#Erstellt den Button Export und führt die Funktion "speicherort" aus
$objButtonExport = New-Object System.Windows.Forms.Button
$objButtonExport.Location = New-Object System.Drawing.Size(620,250)
$objButtonExport.Size = New-Object System.Drawing.Size(100,50)
$objButtonExport.Text = "Export"
$objButtonExport.Add_Click{speicherort}
$newObjForm.Controls.Add($objButtonExport)


#Die GUI "newObjForm" wird ausgegeben
[void] $newObjForm.ShowDialog()

