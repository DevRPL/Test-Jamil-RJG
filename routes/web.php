<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\VoucherController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('vouchers', VoucherController::class);
});

Route::get('/soal-test-1', function () {
    $voucer = \DB::table('voucher')->select(['kode_vch', 'start_date', 'kode_dept', \DB::raw('SUBSTR(id_vch, 1, 5) as no_voucher')])->get();
    dd($voucer);
});

require __DIR__.'/auth.php';
