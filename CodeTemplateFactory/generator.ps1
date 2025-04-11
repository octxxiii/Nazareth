# Set UTF-8 encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Display menu
Write-Host "Select template:"
Write-Host "1) Kotlin Android (MVVM + Hilt)"
Write-Host "2) Flutter (Clean Architecture)"
Write-Host "3) React Native (Redux + Saga)"
Write-Host "4) FastAPI (Python)"
Write-Host "5) Node.js (Express)"
Write-Host "6) Next.js (Web)"

# Get user input
$choice = Read-Host "Choice (1-6)"
$project_name = Read-Host "Project name"

if ($choice -eq "1" -or $choice -eq "4" -or $choice -eq "5") {
    $package_name = Read-Host "Package name (e.g., com.example.app)"
}

# Set template directory and output category
switch ($choice) {
    "1" { 
        $template_dir = "templates\kotlin-android\mvvm-hilt"
        $category = "android"
    }
    "2" { 
        $template_dir = "templates\flutter\clean-architecture"
        $category = "flutter"
    }
    "3" { 
        $template_dir = "templates\react-native\redux-saga"
        $category = "react-native"
    }
    "4" { 
        $template_dir = "templates\fastapi\clean-architecture"
        $category = "python"
    }
    "5" { 
        $template_dir = "templates\nodejs\express"
        $category = "nodejs"
    }
    "6" { 
        $template_dir = "templates\nextjs"
        $category = "nextjs"
    }
    default { Write-Host "Invalid choice"; exit }
}

# Create output and category directories
$output_dir = Join-Path -Path $PWD -ChildPath "output"
$category_dir = Join-Path -Path $output_dir -ChildPath $category
$project_dir = Join-Path -Path $category_dir -ChildPath $project_name

# Create directories
New-Item -ItemType Directory -Path $output_dir -Force | Out-Null
New-Item -ItemType Directory -Path $category_dir -Force | Out-Null
New-Item -ItemType Directory -Path $project_dir -Force | Out-Null

# Copy and process template files
$template_path = Join-Path -Path $PWD -ChildPath $template_dir
Get-ChildItem -Path $template_path -Recurse -File | ForEach-Object {
    $relative_path = $_.FullName.Substring($template_path.Length + 1)
    $target_path = Join-Path -Path $project_dir -ChildPath $relative_path.Replace(".template", "")
    $target_dir = Split-Path -Path $target_path -Parent
    
    # Create target directory if it doesn't exist
    if (-not (Test-Path $target_dir)) {
        New-Item -ItemType Directory -Path $target_dir -Force | Out-Null
    }
    
    # Read content and replace placeholders
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    $content = $content.Replace("{{ project_name }}", $project_name)
    if ($package_name) {
        $content = $content.Replace("{{ package_name }}", $package_name)
    }
    
    # Write content to target file
    Set-Content -Path $target_path -Value $content -Encoding UTF8 -NoNewline
    Write-Host "Created file: $relative_path"
}

Write-Host "`nProject created successfully: $project_name"
Write-Host "Location: $project_dir" 