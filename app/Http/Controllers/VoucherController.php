<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VoucherController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('voucher.index', ['vouchers' => DB::table('vouchers')->orderBy('id','Desc')->get()]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('voucher.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $query = DB::table('vouchers')->orderBy('id','Desc')->first();

        $numberOld = isset($query) ? preg_replace('/[^0-9]+/', '', $query->code) : 0;
        $code = 'VCH-' . str_pad($numberOld + 1, 6, '0', STR_PAD_LEFT);
        $now = now()->timezone('Asia/Jakarta')->format('Y-m-d H:i:s');

        DB::table('vouchers')->insert([
            'code' => $code,
            'event' => $request->event,
            'nominal' => $request->nominal,
            'start_date' => $request->start_date,
            'expired_date' => $request->expired_date,
            'status' => $request->status,
            'created_at' => $now,
        ]);

        return redirect()->route('vouchers.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return view('voucher.edit', ['voucher' =>  DB::table('vouchers')->find($id)]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $now = now()->timezone('Asia/Jakarta')->format('Y-m-d H:i:s');

        DB::table('vouchers')->where('id', '=', $id)->update([
            'event' => $request->event,
            'nominal' => $request->nominal,
            'start_date' => $request->start_date,
            'expired_date' => $request->expired_date,
            'status' => $request->status,
            'updated_at' => $now,
        ]);

        return redirect()->route('vouchers.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        DB::table('vouchers')->where('id', '=', $id)->delete();

        return redirect()->back();
    }
}
