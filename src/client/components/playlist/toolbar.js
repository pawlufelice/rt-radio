import $ from "jquery";
import {Observable} from "rxjs";

import {ElementComponent} from "../../lib/component";

export class PlaylistToolbarComponent extends ElementComponent {
	constructor(playlistStore) {
		super("div");
		this._playlist = playlistStore;
		this.$element.addClass("toolbar");
	}
	
	_onAttach() {
		const $addButton = $(`
			<a href="#" class="add-button">
				Add Video
			</a>
			<p class="username-msg">Enter your username to add a video to the playlist</p>
			`).appendTo(this.$element);

			
		Observable.fromEventNoDefault($addButton, "click")
			.flatMap(() => Observable.fromPrompt("Enter the URL of the video"))
			.filter(url => url && url.trim().length)
			.flatMap(url => this._playlist.addSource$(url).catchWrap())
			.compSubscribe(this, result => {
				if (result && result.error)
					alert(result.error.message || "Unknown Error");
			});
	}
}