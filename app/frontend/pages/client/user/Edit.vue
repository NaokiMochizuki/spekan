<template>
  <Pageheader heading="顧客編集" :maintitle='["Top", "顧客管理", "顧客編集"]' />
  <div class="col-xl-12">
    <div class='card custom-card'>
      <div class="card-header justify-content-between">
        <div class="card-title">基本情報</div>
      </div>
      <div class='card-body' style='padding-inline: 1.563rem;'>
        <div class='row'>
          <div class="col-md-5 mb-3">
              <label for="form-text1" class="form-label fs-14">名前</label>
              <div class="input-group">
                <div class="input-group-text">
                  <i class="ri-user-line"></i>
                </div>
                <input type="text" class="form-control" id="form-text1" placeholder="">
              </div>
          </div>
          <div class="col-md-5 mb-3">
              <label for="form-text1" class="form-label fs-14 text-dark">名前</label>
              <div class="input-group">
                <div class="input-group-text">
                  <i class="ri-user-line"></i>
                </div>
                <input type="text" class="form-control" id="form-text1" placeholder="">
              </div>
          </div>
        </div>
        <div class='row'>
          <div class="col-md-6 mb-3">
              <label for="form-password1" class="form-label fs-14 text-dark">Enter
                Password</label>
              <div class="input-group">
                <div class="input-group-text">
                  <i class="ri-lock-line"></i>
                </div>
                <input type="password" class="form-control" id="form-password1" placeholder="">
              </div>
          </div>
        </div>
        <div class="form-check mb-3">
          <input class="form-check-input" type="checkbox" value="" id="invalidCheck1" required>
          <label class="form-check-label" for="invalidCheck1">
            Accept Policy
          </label>
        </div>
        <button class="btn btn-primary float-end" type="submit">Submit</button>
      </div>
    </div>
  </div>
  <div class='row'>
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">ランク変更</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <div class='row'>
            <div class="col-md-5 mb-3">
                <label for="form-text1" class="form-label fs-14">名前</label>
                <div class="input-group">
                  <div class="input-group-text">
                    <i class="ri-user-line"></i>
                  </div>
                  <input type="text" class="form-control" id="form-text1" placeholder="">
                </div>
            </div>
            <div class="col-md-5 mb-3">
                <label for="form-text1" class="form-label fs-14 text-dark">名前</label>
                <div class="input-group">
                  <div class="input-group-text">
                    <i class="ri-user-line"></i>
                  </div>
                  <input type="text" class="form-control" id="form-text1" placeholder="">
                </div>
            </div>
          </div>
          <div class='row'>
            <div class="col-md-6 mb-3">
                <label for="form-password1" class="form-label fs-14 text-dark">Enter
                  Password</label>
                <div class="input-group">
                  <div class="input-group-text">
                    <i class="ri-lock-line"></i>
                  </div>
                  <input type="password" class="form-control" id="form-password1" placeholder="">
                </div>
            </div>
          </div>
          <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" value="" id="invalidCheck1" required>
            <label class="form-check-label" for="invalidCheck1">
              Accept Policy
            </label>
          </div>
          <button class="btn btn-primary float-end" type="submit">Submit</button>
        </div>
      </div>
    </div>
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">ポイント付与</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <div class='row'>
            <div class="col-md-5 mb-3">
                <label for="form-text1" class="form-label fs-14">名前</label>
                <div class="input-group">
                  <div class="input-group-text">
                    <i class="ri-user-line"></i>
                  </div>
                  <input type="text" class="form-control" id="form-text1" placeholder="">
                </div>
            </div>
            <div class="col-md-5 mb-3">
                <label for="form-text1" class="form-label fs-14 text-dark">名前</label>
                <div class="input-group">
                  <div class="input-group-text">
                    <i class="ri-user-line"></i>
                  </div>
                  <input type="text" class="form-control" id="form-text1" placeholder="">
                </div>
            </div>
          </div>
          <div class='row'>
            <div class="col-md-6 mb-3">
                <label for="form-password1" class="form-label fs-14 text-dark">Enter
                  Password</label>
                <div class="input-group">
                  <div class="input-group-text">
                    <i class="ri-lock-line"></i>
                  </div>
                  <input type="password" class="form-control" id="form-password1" placeholder="">
                </div>
            </div>
          </div>
          <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" value="" id="invalidCheck1" required>
            <label class="form-check-label" for="invalidCheck1">
              Accept Policy
            </label>
          </div>
          <button class="btn btn-primary float-end" type="submit">Submit</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Pageheader from "../../../components/shared/pageheader/pageheader.vue"
export default {
  name: 'clientUserEdit',
  components: { Pageheader },
}
</script>

<style>
</style>

