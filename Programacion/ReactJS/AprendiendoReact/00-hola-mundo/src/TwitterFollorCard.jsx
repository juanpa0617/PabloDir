import { useState } from 'react';

export function TwitterFollowCard({ children, UserName, initialIsFollowing }) {
  const [isFollowing, setIsFollowing] = useState(initialIsFollowing);

  const text = isFollowing ? 'Siguiendo' : 'Seguir';
  const buttonClass = isFollowing ? 'tw-followCard-button is-following' : 'tw-followCard-button';

  return (
    <article className='tw-followCard'>
      <header className='tw-followCard-header'>
        <img
          className='tw-followCard-avatar'
          src={`https://unavatar.io/${UserName}`}
          alt={`El avatar de ${UserName}`}
        />
        <div className='tw-followCard-info'>
          <strong>{children}</strong>
          <span className='tw-followCard-infoUserName'>@{UserName}</span>
        </div>
      </header>
      <aside>
        <button className={buttonClass} onClick={() => setIsFollowing(!isFollowing)}>
          {text}
        </button>
      </aside>
    </article>
  );
}
