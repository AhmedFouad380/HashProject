<link rel="stylesheet" href="{{asset('dashboard/dropify/dist/css/dropify.min.css')}}">
                    <form class="px-10" novalidate="novalidate" id="kt_form"  method="post" action="{{url('Update_Synonym')}}" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label>{{__('lang.word')}} </label>
                            <input type="text" class="form-control form-control-solid" name="word" value="{{$User->word}}" required placeholder="{{__('lang.Users_Name')}}" >
                            <input type="hidden" class="form-control form-control-solid" name="id" value="{{$User->id}}" required placeholder="{{__('lang.Users_Name')}}" >
                        </div>

                        <div class="form-group">
                            <label>{{__('lang.synonym')}} </label>
                            <input type="text" class="form-control form-control-solid" name="synonym" value="{{$User->synonym}}"   required placeholder="{{__('lang.phone')}}" >
                        </div>



                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('lang.Close')}}</button>
                            <button type="submit" class="btn btn-primary">{{__('lang.save')}}</button>
                        </div>
                        <!--begin: Wizard Step 1-->
                        <!--end: Wizard Step 1-->
                        <!--begin: Wizard Step 2-->
                        <!--end: Wizard Step 2-->
                        <!--begin: Wizard Step 3-->
                        <!--end: Wizard Step 3-->
                        <!--begin: Wizard Actions-->
                        <!--end: Wizard Actions-->
                    </form>




<script src="{{asset('dashboard/dropify/dist/js/dropify.min.js')}}"></script>
<script>
    $(document).ready(function() {
        // Basic
        $('.dropify').dropify();

        // Used events
        var drEvent = $('#input-file-events').dropify();

        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });

        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });

        drEvent.on('dropify.errors', function(event, element) {
            console.log('Has Errors');
        });

        var drDestroy = $('#input-file-to-destroy').dropify();
        drDestroy = drDestroy.data('dropify')
        $('#toggleDropify').on('click', function(e) {
            e.preventDefault();
            if (drDestroy.isDropified()) {
                drDestroy.destroy();
            } else {
                drDestroy.init();
            }
        })
    });
</script>

