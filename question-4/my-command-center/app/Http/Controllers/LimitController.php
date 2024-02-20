<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class LimitController extends Controller
{
    public function setLimits(Request $request)
    {
        // Extract memory and storage limits from the request
        $memoryLimit = $request->input('memory_limit');
        $storageLimit = $request->input('storage_limit');
        $user = $request->input("user");

        // Send the limits to the Go agent (assuming it's running on localhost)
        $response = Http::post('http://localhost:8080/set-limits', [
            'memory_limit' => $memoryLimit,
            'storage_limit' => $storageLimit,
            'user' => $user
        ]);
        $responseDecode = json_decode($response->body());
        return response()->json(['message' => $responseDecode]);
    }
}
