<?php

namespace App\Helpers;

use Aws\S3\S3Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use ZipArchive;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\StreamedResponse;

class FileHelper
{

    static function uploadFileToS3(Request $file, string $upload_path): string
    {
        $path = $file->store($upload_path, 's3');

        $setVisibility = Storage::setVisibility($path, 'public');

        $url = Storage::url($path);

        return $url;
    }

    static function generateZip(array $fileUrls, string $fileName, string $storagePath): array
    {
        // Create a new ZIP archive
        $zip = new ZipArchive;

        // generate zip file name
        $fileName = $fileName . '.zip';

        // get storage path
        $zipFilePath = storage_path($storagePath . $fileName);

        // open ZipArchive and check if it is open
        if ($zip->open($zipFilePath, ZipArchive::CREATE | ZipArchive::OVERWRITE) !== true) {
            return response()->json(['message' => 'Failed to create ZIP archive.'], 500);
        }

        // Download each file from S3 and add it to the ZIP archive
        foreach ($fileUrls as $url) {
            // Extract the filename from the URL
            $filename = Str::random(3) . basename($url);

            // Download the file from the URL
            $fileContents = file_get_contents($url);

            // Add the file to the ZIP archive
            $zip->addFromString($filename, $fileContents);
        }

        // Close the ZIP archive
        $zip->close();

        // rerun
        return [
            'zip_file_path' => $zipFilePath,
            'zip_file_name' => $fileName
        ];
    }
}
