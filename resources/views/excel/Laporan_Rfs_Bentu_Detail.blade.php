<table style ="width:100%;">
    <thead>
        <tr>
            <th colspan="8" style="text-align:center; font-weight: bold; font-size: 14px;"> Procurement Report By {{$dtl[0]->usr_fullname}}</th>
        </tr>
        <tr>
            <th colspan="8" style="text-align:center; font-weight: bold; font-size: 12px;"> {{date('d M Y')}}</th>
        </tr>
        <tr>
            <br>
        </tr>
        <tr>
            @php
                $value = $dtl[0]->rfs_hps;
                $format = number_format($value, 2, ".", ",");
            @endphp
            <th colspan="2" style="text-align:left; font-weight: bold; font-size: 12px;"> No. RFS</th>
            <th colspan="1" style="text-align:left; font-weight: bold; font-size: 12px;"> {{ $dtl[0]->rfs_id }} </th>
            <th colspan="1" style="text-align:left; font-weight: bold; font-size: 12px;"> Title Tender</th>
            <th colspan="6" style="text-align:left; font-weight: bold; font-size: 12px;"> {{$dtl[0]->rfs_name}}</th>
        </tr>
        <tr>
            <th colspan="2" style="text-align:left; font-weight: bold; font-size: 12px;"> HPS/OE</th>
            <th colspan="1" style="text-align:left; font-weight: bold; font-size: 12px;"> {{$dtl[0]->rfs_valuta_code}} {{ $format }}</th>
            <th colspan="1" style="text-align:left; font-weight: bold; font-size: 12px;"> Date Received</th>
            <th colspan="2" style="text-align:left; font-weight: bold; font-size: 12px;"> {{$dtl[0]->rfs_date}}</th>
        </tr>
        <tr>
            <br>
        </tr>
    <tr>
        <th style="text-align:center; font-weight: bold;">No</th>
        <th style="text-align:center; font-weight: bold;">Current Process</th>
        <th style="text-align:center; font-weight: bold;">Remarks</th>
        <th style="text-align:center; font-weight: bold;">Next Process</th>
    </tr>   
    </thead>
    <tbody>
    @php $no=1 @endphp
    @foreach($dtl as $d)
        <tr>
            <td style="text-align:left;" width="5"  height="5">{{ $no++ }}</td>
            <td style="text-align:left;" width="30" height="15">{{ $d->rfs_current }}</td>
            <td style="text-align:left;" width="30" height="15">{{ $d->rfs_remark }}</td>
            <td style="text-align:left;" width="30" height="15">{{ $d->rfs_next}}</td>
        </tr>
    @endforeach
    </tbody>
</table>