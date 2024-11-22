const searchRidesInit = async () => {
   let table = $('#rideTable').DataTable({
            serverSide: false,
            ajax: {
                url: `http://localhost:8080/CampusCoRide_war/services/api/forms`,
                type: 'GET',
                dataSrc: ''
            },
            order: [[0, 'asc']],
            rowId: 'id',
            select: true,
            columns: [
                {
                    data: null,
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    },
                    orderable: true,
                    searchable: false
                },
                {data: 'roleType', searchable: true},
                {data: 'requestType', searchable: true},
                {data: 'location.locationName', searchable: true},
                {data: 'location.lat', visible: false},
                {data: 'location.lng', visible: false},
                {data: 'date', searchable: true},
                {data: 'time', searchable: true},
                {data: 'notes', searchable: true},
            ],
       columnDefs: [
           {
               targets: -1,
               data: 'notes',
               render: function (data, type, row, meta) {
                   return `<span style="white-space:normal; word-wrap: break-word; text-align: end; overflow-wrap: break-word; text-overflow: clip;">${data}</span>`
               }
           },
       ],
            layout: {
                topEnd: {
                    search: {
                        placeholder: 'Search',
                        processing: true
                    }
                }
            }
        });
}

window.onload = searchRidesInit;
