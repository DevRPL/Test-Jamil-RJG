<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Vouchers') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm: lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <div class="flex mb-4">
                        <a href="{{ route('vouchers.create') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                          Create
                        </a>
                      </div>
                    <table id="example" class="stripe hover w-full text-center text-sm font-light" style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                        <thead class="bg-gray-50">
                          <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Voucher Id</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Event</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nominal</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Start Date</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Expired Date</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
                          </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach ($vouchers as $no => $voucer)
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">{{ $no + 1 }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">{{ $voucer->code }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">{{ $voucer->event }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">{{ $voucer->nominal }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">{{ Carbon\Carbon::parse($voucer->start_date)->format('d F Y') }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">{{ Carbon\Carbon::parse($voucer->expired_date)->format('d F Y') }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    @if($voucer->status == 1)
                                        OPEN
                                    @else
                                        CLOSED
                                    @endif
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap flex justify-center space-x-2">
                                    <a href="{{ route('vouchers.edit', $voucer->id) }}" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"> Edit </a>
                                    <form action="{{ route('vouchers.destroy',[$voucer->id])}}" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" method="POST">
                                        @method('DELETE')
                                        @csrf
                                        <button type="submit"> Delete </button>
                                    </form>
                                </td>
                            </tr>
                          @endforeach
                          <!-- More rows... -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
