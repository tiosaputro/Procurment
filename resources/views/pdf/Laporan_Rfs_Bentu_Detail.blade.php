<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
  <head>
  	<title>E-Procurment</title>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <base href="/">
 
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="assets/pdf/style.css">

	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-6">
					<h2 class="heading-section">PROCURMENT STATUS REPORT</h2>
                    <h4 class="heading-section"> {{$dtl[0]->usr_fullname}} </h4>
				</div>
			</div>
            @php
                $value = $dtl[0]->rfs_hps;
                $format = number_format($value, 2, ".", ",");
            @endphp
            <div class="col-md-12" >
				<br>
                    <div class="footer">
                        <h6 style="text-align:justify; font-weight: bold;">No. RFS : {{$dtl[0]->rfs_id}}</h6>
                        <h6 style="text-align:justify; font-weight: bold;">Title Tender : {{$dtl[0]->rfs_name}}</h6>
                    </div>
                    <div class="footer">
                        <h6 style="text-align:justify;font-weight: bold;"> HPS/OE : {{$dtl[0]->rfs_valuta_code}} {{ $format }}</h6>
                        <h6 style="text-align:justify;font-weight: bold;"> Date Received : {{$dtl[0]->rfs_date}}</h6>
                    </div>	
                    <div class="footer">
                        <h6 style="text-align:justify; font-weight: bold;"> Tender Status :  {{$dtl[0]->rfs_status}}</h6>
                        <h6></h6>
				    </div>
            </div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table table-striped">
						  <thead>
						    <tr>
						      <th>No</th>
						      <th>Current Process </th>
						      <th>Remarks</th>
						      <th>Next Process</th>
						    </tr>
						  </thead>
						  <tbody>
                          @php $no=1 @endphp
                         @foreach($dtl as $d)
						    <tr>
						      <td> {{$no++}}</td>
						      <td>{{$d->rfs_current}} </td>
						      <td> {{$d->rfs_remark}} </td>
						      <td> {{$d->rfs_next}} </td>
						    </tr>
                        @endforeach
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

  <script type="text/js" src="assets/pdf/jquery.min.js"></script>
  <script type="text/js" src="assets/pdf/popper.js"></script>
  <script type="text/js" src="assets/pdf/bootstrap.min.js"></script>
  <script type="text/js" src="assets/pdf/main.js"></script>

	</body>
</html>

